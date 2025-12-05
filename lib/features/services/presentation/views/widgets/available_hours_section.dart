import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:flutter/material.dart';

class AvailableHoursSection extends StatelessWidget {
  const AvailableHoursSection({
    super.key,
    required this.firstTimeController,
    required this.lastTimeController,
    required this.onSelect,
  });

  final TextEditingController firstTimeController;
  final TextEditingController lastTimeController;
  final Future<void>Function(TextEditingController) onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        
        SizedBox(
          width: 150,
          height: 90,
          child: CustomTextFormFieldComponent(
            controller: firstTimeController,
            isReadOnly: true,
            hint: 'من',
            onTap: () => onSelect(firstTimeController),
          ),
        ),
        const Spacer(),
         SizedBox(
          width: 150,
          height: 90,
          child: CustomTextFormFieldComponent(
            controller: lastTimeController,
            isReadOnly: true,
            hint: 'الى',
            onTap: () => onSelect(lastTimeController),
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
