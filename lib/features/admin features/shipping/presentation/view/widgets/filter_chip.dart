import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ShippingFilterChip extends StatelessWidget {
  const ShippingFilterChip({super.key, 
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF003D9B) : const Color(0xFFEDEEF0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: Styles.textStyle14.copyWith(
            color: isSelected ? Colors.white : const Color(0xFF434654),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
