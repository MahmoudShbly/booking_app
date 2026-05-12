import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class DueSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
  final Color valueColor;
  final Color borderColor;
  final Color backgroundColor;

  const DueSummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconBackgroundColor = const Color(0xFFFDE7E7),
    this.iconColor = const Color(0xFFBA1A1A),
    this.valueColor = const Color(0xFFBA1A1A),
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(icon, color: iconColor, size: 16),
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: Styles.textStyle16.copyWith(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
