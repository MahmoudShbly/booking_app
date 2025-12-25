import 'package:booking_app/core/utils/app_dialog.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextButtonSection extends StatelessWidget {
  const TextButtonSection({super.key, required this.isDone});
  final bool isDone;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (!isDone) {
          showAppDialog(
            context: context,
            title: Text('تأكيد',style: Styles.textStyle26,),
            message: 'هل انت متاكد من رغبتك في الغاء مواعدك مع عيادة الرضوان في الساعة 10م علما انه لا يمكنك استرجاع رسوم الحجز في حال تاكيده من قبل صاحب الخدمة',
            onConfirm: (){},
            cancelText: 'رجوع',
            confirmText: 'نعم',
            confirmBorder: Border.all(color: Colors.red),
            confirmColor:Colors.red,

          );
        }
      },
      child: Container(
        width: 80,
        height: 35,
        decoration: BoxDecoration(
          border: Border.all(color: isDone ? Colors.amber : Colors.red),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            isDone ? 'تقييم' : 'الغاء',
            style: Styles.textStyle18.copyWith(
              color: isDone ? Colors.black : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
