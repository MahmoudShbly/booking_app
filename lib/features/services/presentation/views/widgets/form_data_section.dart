import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/services/presentation/views/widgets/available_days_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/available_hours_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/buttons_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/choose_city_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/price_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/time_picker_box_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/title_section.dart';
import 'package:flutter/material.dart';

class FormDataSection extends StatefulWidget {
  const FormDataSection({super.key});
  @override
  State<FormDataSection> createState() => _FormDataSectionState();
}

class _FormDataSectionState extends State<FormDataSection> {
  late TextEditingController serviceName;
  late TextEditingController serviceLocation;
  late TextEditingController firstTime;
  late TextEditingController lastTime;
  late TextEditingController bookPrice;
  late TextEditingController fullPrice;
  final   GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    bookPrice.dispose();
    fullPrice.dispose();
    firstTime.dispose();
    lastTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleSection(title: 'اسم الخدمة'),
          CustomTextFormFieldComponent(
            hint: 'اسم الخدمة الذي سيظهر عند المستخدم',
            controller: serviceName,
          ),
          const SizedBox(height: 20),
          TitleSection(title: 'المدينة'),
          ChooseCitySection(),
          const SizedBox(height: 20),
          TitleSection(title: 'الموقع'),
          CustomTextFormFieldComponent(
            hint: 'موقع الخدمة ',
            controller: serviceLocation,
          ),
          const SizedBox(height: 20),
          TitleSection(title: 'الزمن اللازم لاتمام الخدمة'),
          TimePickerBoxSection(),
          TitleSection(title: 'ايام الخدمة المتاحة'),
          const SizedBox(height: 20),
          AvailableDaysSection(),
          const SizedBox(height: 30),
          TitleSection(title: 'ساعات الخدمة المتاحة'),
          AvailableHoursSection(
            firstTimeController: firstTime,
            lastTimeController: lastTime,
            onSelect: selectTime,
          ),
          const SizedBox(height: 20),
          PriceSection(
            bookPriceController: bookPrice,
            fullPriceController: fullPrice,
          ),
          const SizedBox(height: 30),
          ButtonsSection(formKey: formKey,),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
