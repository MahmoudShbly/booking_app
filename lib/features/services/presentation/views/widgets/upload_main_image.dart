import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_image_box.dart';
import 'package:flutter/material.dart';

class UploadMainImage extends StatelessWidget {
  const UploadMainImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
                    Text(
              'اختر صورة رئيسية للخدمة :',
              style: Styles.textStyle26.copyWith(color: kBlue),
            ),
            SizedBox(height: 24),
            UploadImageBox(),
      ],
    );
  }
}