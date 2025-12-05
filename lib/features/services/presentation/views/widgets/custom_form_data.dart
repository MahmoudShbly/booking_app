import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/services/presentation/views/widgets/available_days_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/available_hours_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/price_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/time_picker_box_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/title_section.dart';
import 'package:flutter/material.dart';

class CustomFormData extends StatefulWidget {
  const CustomFormData({super.key});

  @override
  State<CustomFormData> createState() => _CustomFormDataState();
}

class _CustomFormDataState extends State<CustomFormData> {
  late TextEditingController serviceName;
  late TextEditingController serviceLocation;
  late TextEditingController timeToComplete;
  late TextEditingController firstTime;
  late TextEditingController lastTime;
  late TextEditingController bookPrice;
  late TextEditingController fullPrice;
  Future<void> selectTime(TextEditingController controller) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (!mounted) return;

    if (selectedTime != null) {
      controller.text = selectedTime.format(context);
    }
  }

  @override
  void initState() {
    serviceName = TextEditingController();
    serviceLocation = TextEditingController();
    timeToComplete = TextEditingController();
    bookPrice = TextEditingController();
    fullPrice = TextEditingController();
    firstTime = TextEditingController();
    lastTime = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    serviceName.dispose();
    serviceLocation.dispose();
    timeToComplete.dispose();
    bookPrice.dispose();
    fullPrice.dispose();
    firstTime.dispose();
    lastTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleSection(title: 'اسم الخدمة'),
        CustomTextFormFieldComponent(
          hint: 'اسم الخدمة الذي سيظهر عند المستخدم',
        ),
        const SizedBox(height: 20),
        TitleSection(title: 'الموقع'),
        CustomTextFormFieldComponent(hint: 'موقع الخدمة '),
        const SizedBox(height: 20),
        TitleSection(title: 'الزمن اللازم لاتمام الخدمة'),
        TimePickerBoxSection(),
        TitleSection(title: 'ايام الخدمة المتاحة'),
        const SizedBox(height: 20),
        AvailableDaysSection(),
        const SizedBox(height: 30),
        TitleSection(title: 'ساعات الخدمة المتاحة'),
        AvailableHoursSection(
          firstTime: firstTime,
          lastTime: lastTime,
          onSelect: selectTime,
        ),
        const SizedBox(height: 20),
        PriceSection(),
      ],
    );
  }
}
