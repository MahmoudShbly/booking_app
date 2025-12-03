import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/material.dart';

class TimePickerBoxSection extends StatefulWidget {
  const TimePickerBoxSection({super.key});

  @override
  State<TimePickerBoxSection> createState() => _TimePickerBoxSectionState();
}

class _TimePickerBoxSectionState extends State<TimePickerBoxSection> {
  int hour = 0;
  int minute = 15;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       
        const Text("دقيقة:"),
        const SizedBox(width: 10),
        NumberPicker(
          minValue: 0,
          maxValue: 59,
          value: minute,
          itemWidth: 60,
          itemHeight: 40,
          onChanged: (value) => setState(() => minute = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(),
          ),
        ),
        const SizedBox(width: 20),
        const Text("ساعة:"),
        const SizedBox(width: 10),
        NumberPicker(
          minValue: 0,
          maxValue: 12,
          value: hour,
          itemWidth: 60,
          itemHeight: 40,
          onChanged: (value) => setState(() => hour = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(),
          ),
        ),
      ],
    );
  }
}
