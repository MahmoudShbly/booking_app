import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/booking_action_buttons.dart';
import 'package:flutter/material.dart';

class BookingRequestCard extends StatelessWidget {
  const BookingRequestCard({super.key, required this.request});

  final BookingRequestModel request;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withValues(alpha: .04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleAvatar(
            radius: 36,
            backgroundColor: const Color(0xFFCCE6FB),
            child: const Icon(Icons.person, size: 32, color: Color(0xFF0F2E57)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  request.userData.name,
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  request.userData.phone,
                  style: Styles.textStyle10.copyWith(
                    color: const Color(0xFF8B95A5),
                  ),
                ),
                const SizedBox(height: 10),
                BookingActionButtons(
                  request: request,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
