import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_image_box.dart';
import 'package:flutter/material.dart';

class UploadMultiImageSection extends StatelessWidget {
  const UploadMultiImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
                    Text(
              'اختر صور اضافية للخدمة :',
              style: Styles.textStyle26.copyWith(color: kBlue),
            ),
            SizedBox(height: 24),
            Stack(clipBehavior: Clip.none,
              children: <Widget>[
                UploadImageBox(),
                Positioned(top: 20,right: 20, child: UploadImageBox()),
              ],
            ),
      ],
    );
  }
}
