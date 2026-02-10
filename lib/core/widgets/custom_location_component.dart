import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomLocationComponent extends StatelessWidget {
  const CustomLocationComponent({super.key,required this.location, this.alignment  = MainAxisAlignment.start});
  final String location;
 final MainAxisAlignment alignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children:  <Widget>[
        Icon(FontAwesomeIcons.locationDot, color: Color(0xffCD1111), size: 16),
        SizedBox(width: 6),
        Text(location, style: TextStyle(color: Colors.black87)),
      ],
    );
  }
}