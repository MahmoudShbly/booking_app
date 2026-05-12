import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'البحث',
          hintStyle: Styles.textStyle20.copyWith(color: Colors.grey),
          suffixIcon: Icon(FontAwesomeIcons.magnifyingGlass, color: kBlue,size: 20,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Color(0xffD9D9D9),
        ),
      ),
    );
  }
}
