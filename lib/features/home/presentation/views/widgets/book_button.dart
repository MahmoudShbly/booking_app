import 'dart:ui';
import 'package:booking_app/core/utils/app_dialog.dart';
import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/home/presentation/manager/book%20service/book_service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key, required this.serviceId});
  final int serviceId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookServiceCubit, BookServiceState>(
      listener: (context, state) {
        if (state is BookServiceFailure && state.serviceId == serviceId) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state is BookServiceSuccess && state.serviceId == serviceId) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.successMessage)),
          );
        }
      },
      builder: (context, state) {
        final bool isCurrentLoading =
            state is BookServiceLoading && state.serviceId == serviceId;
        final bool isCurrentSuccess =
            state is BookServiceSuccess && state.serviceId == serviceId;

        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white.withValues(alpha: 0.6),
              child: SizedBox(
                child: CustomButtonComponent(
                  border: isCurrentSuccess ? Border.all(color: kBlue) : null,
                  color: isCurrentSuccess ? Colors.white : kBlue,
                  isLoading: isCurrentLoading,
                  borderRadius: 16,
                  title: isCurrentSuccess ? 'تم الحجز' : 'احجز الان',
                  titleStyle: Styles.textStyle26.copyWith(
                    color: isCurrentSuccess ? kBlue : Colors.white,
                  ),
                  height: 55,
                  width: double.infinity,
                  onTap: (isCurrentLoading || isCurrentSuccess)
                      ? null
                      : () {
                    showAppDialog(
                      context: context,
                      title: Text('تأكيد طلب الحجز', style: Styles.textStyle26),
                      message: 'هل أنت متأكد من رغبتك في حجز هذه الخدمة؟',

                      onConfirm: () {
                        GoRouter.of(context).pop();
                        context.read<BookServiceCubit>().bookService(serviceId);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
