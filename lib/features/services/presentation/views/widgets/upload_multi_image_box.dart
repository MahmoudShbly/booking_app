import 'dart:io';

import 'package:booking_app/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImageBox extends StatelessWidget {
  const UploadMultiImageBox({
    super.key,
     this.images,
    required this.onTap,
  });

  final List<XFile>? images;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          // الصورة الثانية (إن وجدت)
          if (images != null && images!.length > 1)
            Positioned(
              top: 20,
              right: 20,
              child: _imageBox(images![1]),
            ),

          // الصورة الأولى أو أيقونة الرفع
          images == null || images!.isEmpty
              ? _emptyBox()
              : _imageBox(images![0]),
        ],
      ),
    );
  }

  Widget _imageBox(XFile image) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.file(
          File(image.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _emptyBox() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Icon(
        FontAwesomeIcons.fileArrowUp,
        color: kBlue,
        size: 40,
      ),
    );
  }
}
