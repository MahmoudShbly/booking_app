import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:flutter/material.dart';

class AvailableHoursSection extends StatelessWidget {
  const AvailableHoursSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 150,
          height: 75,
          child: CustomTextFormFieldComponent(
            
            isReadOnly: true,
            hint: 'من',
            onTap: () =>
                showTimePicker(context: context, initialTime: TimeOfDay.now()),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 150,
          height: 75,
          child: CustomTextFormFieldComponent(
            isReadOnly: true,
            hint: 'الى',
            onTap: () =>
                showTimePicker(context: context, initialTime: TimeOfDay.now()),
          ),
        ),
      ],
    );
  }
}
