import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PullButtonSection extends StatelessWidget {
  const PullButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 46, vertical: 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(31, 255, 255, 255),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wallet,color: Colors.white,),
            SizedBox(
              width: 8,
            ),
            Text(
              'طلب سحب',
              style: Styles.textStyle12.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
