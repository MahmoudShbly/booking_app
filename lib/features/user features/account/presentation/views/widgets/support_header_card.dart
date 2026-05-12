import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SupportHeaderCard extends StatelessWidget {
  const SupportHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF0C2E58), Color(0xFF1A4D84)],
        ),
      ),
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF244F7F),
              borderRadius: BorderRadius.circular(10),
            ),
            child:  Text(
              'مساعدتك أولويتنا',
              style: Styles.textStyle12.copyWith(color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),
           Text(
            'كيف يمكننا مساعدتك اليوم؟',
            textAlign: TextAlign.center,
            style: Styles.textStyle24.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 9),
           Text(
            'نحن هنا لنضمن لك تجربة استثنائية تعكس فخامة تطبيقنا وتساعدك على جعل حياتك اسهل',
            textAlign: TextAlign.center,
            style: Styles.textStyle14.copyWith(
              color: Colors.white70,
              
            )
          ),
        ],
      ),
    );
  }
}
