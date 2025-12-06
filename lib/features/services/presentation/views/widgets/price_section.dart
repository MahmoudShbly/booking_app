import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/services/presentation/views/widgets/title_section.dart';
import 'package:flutter/material.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
    required this.bookPriceController,
    required this.fullPriceController,
  });
  final TextEditingController bookPriceController;
  final TextEditingController fullPriceController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TitleSection(title: 'عدد النقاط المطلوب لتثبيت الحجز'),
        CustomTextFormFieldComponent(
          hint: 'كل نقطة تساوي 1000 ل.س',
          controller: bookPriceController,
          type: TextInputType.number,
        ),
        const SizedBox(height: 20),
        Text(
          'سعر الخدمة كاملا بالنجوم :',
          style: Styles.textStyle26.copyWith(color: kBlue),
        ),
        CustomTextFormFieldComponent(
          hint: 'يمكنك تركه فارغا في حال عدم وجود سعر ثابت للخدمة',
          controller: fullPriceController,
          isRequired: false,
          type: TextInputType.number,          
        ),
      ],
    );
  }
}
