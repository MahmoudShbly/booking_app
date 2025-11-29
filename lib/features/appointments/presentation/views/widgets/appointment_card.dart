import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: kBlue, width: 1),
        color: kLightBlue,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(FontAwesomeIcons.locationDot, size: 15, color: Colors.red),
                Text('حمص - باب هود - بالقرب من معرض زيني'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                width: 80,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'الغاء',
                    style: Styles.textStyle18.copyWith(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
