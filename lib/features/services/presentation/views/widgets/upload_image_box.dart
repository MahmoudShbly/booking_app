import 'package:booking_app/core/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class UploadImageBox extends StatelessWidget {
  const UploadImageBox({super.key, required this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        border: BoxBorder.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(FontAwesomeIcons.fileArrowUp, color: kBlue, size: 40),
      ),
    );
  }
}
