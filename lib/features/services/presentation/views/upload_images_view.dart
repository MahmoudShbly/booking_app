import 'package:booking_app/features/services/presentation/views/widgets/custom_app_bar.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_main_image.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_multi_image_section.dart';
import 'package:flutter/material.dart';

class UploadImagesView extends StatelessWidget {
  const UploadImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 32),
            CustomAppBar(),
            UploadMainImage(),
            SizedBox(height: 50),
            UploadMultiImageSection(),
          ],
        ),
      ),
    );
  }
}
