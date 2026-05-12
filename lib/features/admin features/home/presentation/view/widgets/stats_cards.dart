import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class UsersTypeCard extends StatelessWidget {
  const UsersTypeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cardDecoration = BoxDecoration(
      color:Colors.white,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.withOpacity(0.2)),
      boxShadow: [
        BoxShadow(
          color: const Color.fromRGBO(19, 49, 92, 0.08),
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );

    Widget statCard(IconData icon, String label, String value) {
      return Container(
        decoration: cardDecoration,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Icon(icon, color: Color(0xff3084D6) , size: 16,),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  label,
                  style: Styles.textStyle16,
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios , size: 16,color: Color(0xff8DA9C4),),
              ],
            ),
            const SizedBox(height: 8),
            const SizedBox(height: 6),
            Text(
              value,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      );
    }

    return Row(
      children: [
        Expanded(
          child: statCard(Icons.person, 'المستخدمين', '653'),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: statCard(Icons.supervisor_account, 'مزودي الخدمة', '85'),
        ),
      ],
    );
  }
}
