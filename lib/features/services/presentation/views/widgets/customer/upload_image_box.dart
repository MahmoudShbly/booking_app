import 'dart:io';

import 'package:booking_app/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:image_picker/image_picker.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox({super.key, required this.onTap, this.image});

  final VoidCallback onTap;
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16),
        ),
        child: image == null
            ? Icon(FontAwesomeIcons.fileArrowUp, color: kBlue, size: 40)
            : ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  File(image!.path),
                  fit: BoxFit.cover,
                  
                ),
              ),
      ),
    );
  }
}
