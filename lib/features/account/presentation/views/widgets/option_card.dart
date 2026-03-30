import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
    this.iconsColor = kBlue,
  });
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color iconsColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xffF2F4F6),
              ),
              child: Icon(icon, size: 24, color: iconsColor),
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: Styles.textStyle16.copyWith(
                color: iconsColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios, size: 16, color: iconsColor),
          ],
        ),
      ),
    );
  }
}
