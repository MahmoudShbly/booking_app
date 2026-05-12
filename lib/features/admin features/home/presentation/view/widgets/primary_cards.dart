import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

import 'due_summary_card.dart';
import 'profit_summary_card.dart';

class PrimaryCards extends StatelessWidget {
  const PrimaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfitSummaryCard(
          title: 'مجموع الارباح الكلي',
          value: '\$6,000',
          icon: FontAwesomeIcons.moneyBillWave,
        ),
        const SizedBox(height: 12),
        const ProfitSummaryCard(
          title: 'النقاط اليومية',
          value: '850',
          icon: FontAwesomeIcons.coins,
          gradientColors: [Color(0xFFFFB800), Color(0xFFE58200)],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            const Expanded(
              child: DueSummaryCard(
                title: 'المستحقات',
                value: '\$5,000',
                icon: Icons.arrow_downward,
              ),
            ),
            const SizedBox(width: 12),
             Expanded(
              child: DueSummaryCard(
                title: 'صافي الربح',
                value: '\$1,000',
                icon: Icons.arrow_upward,
                iconBackgroundColor: Color(0xFFE8F5E9),
                iconColor: Color(0xFF6EB53E),
                valueColor: Colors.green.shade700,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
