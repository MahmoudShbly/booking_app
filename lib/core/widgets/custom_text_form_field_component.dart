import 'package:flutter/material.dart';

class CustomTextFormFieldComponent extends StatelessWidget {
  const CustomTextFormFieldComponent({
    super.key,
    required this.hint,
    this.onTap,
    this.isReadOnly,
    this.controller,
    this.isRequired = true,
  });
  final String hint;
  final VoidCallback? onTap;
  final bool? isReadOnly;
  final TextEditingController? controller;
  final bool isRequired;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        validator: isRequired
            ? (value) {
                if (value == null || value.isEmpty) {
                  return 'هذا الحقل مطلوب';
                }
                return null;
              }
            : null,
        readOnly: isReadOnly ?? false,
        controller: controller,
        onTap: onTap,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
    );
  }
}
