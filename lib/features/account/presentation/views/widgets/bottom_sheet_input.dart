import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BottomSheetInput extends StatelessWidget {
  const BottomSheetInput({super.key, required this.hintText, required this.icon});

  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Styles.textStyle12.copyWith(color: const Color(0xffA9B0BB)),
        prefixIcon: Icon(icon, color: const Color(0xffC1C7D0), size: 18),
        filled: true,
        fillColor: const Color(0xffEFF2F5),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xffD5DCE5)),
        ),
      ),
    );
  }
}
