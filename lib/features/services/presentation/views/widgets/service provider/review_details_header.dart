import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReviewDetailsHeader extends StatelessWidget {
  const ReviewDetailsHeader({super.key,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () => GoRouter.of(context).pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Color(0xFF1A4C80),
              size: 32,
            ),
          ),
          SizedBox(
            width: 22,
          ),
          Text(
            'اراء المراجعين',
            style: Styles.textStyle26.copyWith(
              color: const Color(0xFF0F3E72),
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}
