import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class FaqTile extends StatelessWidget {
  const FaqTile({super.key, required this.title, required this.answer});

  final String title;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: const Color(0xFF274D77),
          collapsedIconColor: const Color(0xFF274D77),
          tilePadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            title,
            style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
          ),
          children: [
            Text(
              answer,
              style: const TextStyle(
                color: Color(0xFF556A81),
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
