import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_location_component.dart';
import 'package:booking_app/features/appointments/presentation/views/widgets/text_button_section.dart';
import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key,  this.isDone = false});
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: kBlue, width: 1),
        color:isDone? Colors.white: kLightBlue,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 2),
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 1,
            spreadRadius: 2,
          )
        ]
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Text(
              'عيادة الرضوان',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('الاربعاء2025/10/11 - 10:00م', style: Styles.textStyle12),
            SizedBox(height: 20),
            Text('المبلغ المدفوع :10,000\nالمبلغ المتبقي : 90,000'),
            SizedBox(height: 20),
            CustomLocationComponent(location: 'حمص - باب هود - بالقرب من معرض زيني',alignment: MainAxisAlignment.center,),
            SizedBox(
              height: 20,
            ),
          TextButtonSection(isDone: isDone)
           
          ],
        ),
      ),
    );
  }
}
