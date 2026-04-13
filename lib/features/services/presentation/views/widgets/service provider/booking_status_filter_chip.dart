import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookingStatusFilterChip extends StatelessWidget {
  const BookingStatusFilterChip({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 9,
          ),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF0F2E57) : const Color(0xFFF0F1F3),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Text(
            title,
            style: Styles.textStyle12.copyWith(
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}
