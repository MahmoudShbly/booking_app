import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ProfitSummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final List<Color> gradientColors;

  const ProfitSummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    
    this.gradientColors = const [Color(0xFF13315C), Color(0xFF001C40)],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(colors: gradientColors),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: Styles.textStyle16.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: Styles.textStyle30.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
