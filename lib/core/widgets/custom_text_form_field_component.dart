import 'package:flutter/material.dart';

class CustomTextFormFieldComponent extends StatelessWidget {
  const CustomTextFormFieldComponent({super.key,required this.hint});
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            
          ),
        ),
        ),
      ),
    );
  }
}