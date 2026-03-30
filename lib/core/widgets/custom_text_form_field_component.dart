import 'package:flutter/material.dart';

class CustomTextFormFieldComponent extends StatelessWidget {
  const CustomTextFormFieldComponent({
    super.key,
    required this.hint,
    this.isObscure=false,
    this.onTap,
    this.isReadOnly=false,
    this.controller,
    this.isRequired = true,
    this.type=TextInputType.text,
    this.fillColor = Colors.white,

  });
  final String hint;
  final bool isObscure;
  final VoidCallback? onTap;
  final bool isReadOnly;
  final TextEditingController? controller;
  final bool isRequired;
  final TextInputType type;
  final Color fillColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        keyboardType:type ,
        validator: isRequired
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              }
            : null,
        readOnly: isReadOnly,
        controller: controller,
        onTap: onTap,
        obscureText: isObscure,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          filled: true,
          fillColor: fillColor,),
      ),
    );
  }
}
