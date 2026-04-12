import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AvailableHoursSection extends StatelessWidget {
  const AvailableHoursSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        BeProviderCubit cubit = context.read<BeProviderCubit>();
        return Row(
          children: [
            SizedBox(
              width: 150,
              height: 90,
              child: CustomTextFormFieldComponent(
                controller: cubit.firstTime,
                isReadOnly: true,
                hint: 'من',
                onTap: () => cubit.selectTime(cubit.firstTime,context),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 150,
              height: 90,
              child: CustomTextFormFieldComponent(
                controller: cubit.lastTime,
                isReadOnly: true,
                hint: 'الى',
                onTap: () => cubit.selectTime(cubit.lastTime,context),
              ),
            ),
          ],
        );
      },
    );
  }


}
