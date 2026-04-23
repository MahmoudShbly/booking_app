import 'package:booking_app/core/utils/app_bottom_sheet.dart';
import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/account/presentation/views/widgets/point_request_form_content.dart';
import 'package:booking_app/features/account/presentation/views/widgets/point_request_header.dart';
import 'package:flutter/material.dart';

class PointRequestButton extends StatelessWidget {
  const PointRequestButton({super.key});

  void _showPointRequestBottomSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      title: const PointRequestHeader(),
      content: const PointRequestFormContent(),
      confirmText: 'إرسال الطلب',
      confirmColor: kBlue,
      confirmWidth: double.infinity,
      onConfirm: () {},
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => _showPointRequestBottomSheet(context),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color:  Colors.white,
          ),
          child: Center(
            child: Text(
              'طلب نقاط',
              style: Styles.textStyle12,
            ),
          ),
        ),
      ),
    );
  }
}
