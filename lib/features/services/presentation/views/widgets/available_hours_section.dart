import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:flutter/material.dart';

class AvailableHoursSection extends StatelessWidget {
  const AvailableHoursSection({
    super.key,
    required this.firstTime,
    required this.lastTime,
  });

  final TextEditingController firstTime;
  final TextEditingController lastTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        SizedBox(
          width: 150,
          height: 75,
          child: CustomTextFormFieldComponent(
            controller: firstTime,
            isReadOnly: true,
            hint: 'من',
            onTap: () => selectTime(context, firstTime),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 150,
          height: 75,
          child: CustomTextFormFieldComponent(
            controller: lastTime,
            isReadOnly: true,
            hint: 'الى',
            onTap: () => selectTime(context, lastTime),
          ),
        ),
      ],
    );
  }

  Future<void> selectTime(
      BuildContext context, TextEditingController controller) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null) {
      controller.text = selectedTime.format(context);
    }
  }
}
