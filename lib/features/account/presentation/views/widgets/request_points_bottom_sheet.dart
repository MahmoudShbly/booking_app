import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/account/presentation/manager/request_points/request_points_cubit.dart';
import 'package:booking_app/features/account/presentation/views/widgets/point_request_form_content.dart';
import 'package:booking_app/features/account/presentation/views/widgets/point_request_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestPointsBottomSheet extends StatefulWidget {
  const RequestPointsBottomSheet({super.key, required this.parentContext});

  final BuildContext parentContext;

  @override
  State<RequestPointsBottomSheet> createState() => RequestPointsBottomSheetState();
}

class RequestPointsBottomSheetState extends State<RequestPointsBottomSheet> {
  final TextEditingController pointsController = TextEditingController();
  final TextEditingController transferIdController = TextEditingController();

  @override
  void dispose() {
    pointsController.dispose();
    transferIdController.dispose();
    super.dispose();
  }

  Future<void> _submitRequest() async {
    final points = pointsController.text.trim();

    await context.read<RequestPointsCubit>().requestPoints(
      data: {
        'amount': points,
        'method': 'vvv',
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestPointsCubit, RequestPointsState>(
      listener: (context, state) {
        if (state is RequestPointsSuccess) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(widget.parentContext).showSnackBar(
            const SnackBar(content: Text('تم إرسال طلب النقاط بنجاح')),
          );
        }

        if (state is RequestPointsFailure) {
          ScaffoldMessenger.of(widget.parentContext).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          top: false,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 12,
              bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 44,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const PointRequestHeader(),
                  const SizedBox(height: 12),
                  PointRequestFormContent(
                    pointsController: pointsController,
                    transferIdController: transferIdController,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButtonComponent(
                      isLoading: state is RequestPointsLoading,
                      titleStyle: Styles.textStyle20.copyWith(color: Colors.white),
                      title: 'إرسال الطلب',
                      onTap: state is RequestPointsLoading ? null : _submitRequest,
                      width: double.infinity,
                      borderRadius: 10,
                      color: kBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
