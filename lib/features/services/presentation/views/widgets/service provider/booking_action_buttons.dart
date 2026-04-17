import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookingActionButtons extends StatelessWidget {
  const BookingActionButtons({super.key, 
    required this.onRefuse,
    required this.onAccept,
  });

  final VoidCallback onRefuse;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            
            onPressed: onAccept,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F2E57),
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size.fromHeight(28),
              textStyle: Styles.textStyle10.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            child: const Text('قبول'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: OutlinedButton(
            onPressed: onRefuse,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFC43A3A),
              side: const BorderSide(color: Color(0xFFE6A2A2)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              minimumSize: const Size.fromHeight(28),
              textStyle: Styles.textStyle10.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            child: const Text('رفض'),
          ),
        ),
      ],
    );
  }
}
