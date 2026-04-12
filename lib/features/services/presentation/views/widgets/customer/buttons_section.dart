import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({super.key, required this.next,});
  final VoidCallback next;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        return Row(
          children: <Widget>[
            Expanded(
              child: CustomButtonComponent(
                title: 'رجوع',
                titleStyle: Styles.textStyle20.copyWith(color: kBlue),
                color: Colors.white,
                border: Border.all(color: kBlue),
                borderRadius: 10,
                onTap: () => GoRouter.of(context).pop(),
              ),
            ),
            Expanded(
              child: CustomButtonComponent(
                title: 'متابعة',
                titleStyle: Styles.textStyle20.copyWith(color: Colors.white),
                borderRadius: 10,
                 onTap: next,
              ),
            ),
          ],
        );
      },
    );
  }
}
