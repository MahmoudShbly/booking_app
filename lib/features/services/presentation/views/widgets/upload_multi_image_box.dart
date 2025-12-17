import 'dart:io';

import 'package:booking_app/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImageBox extends StatelessWidget {
  const UploadMultiImageBox({super.key, this.images, required this.onTap});
  final List<XFile>? images;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                border: BoxBorder.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: images == null
                  ? null
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(images![1].path),
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          Container(
            width: 160,
            height: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16),
            ),
            child: images == null
                ? Icon(FontAwesomeIcons.fileArrowUp, color: kBlue, size: 40)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16),

                    child: Image.file(File(images![0].path), fit: BoxFit.cover),
                  ),
          ),
        ],
      ),
    );
  }
}
