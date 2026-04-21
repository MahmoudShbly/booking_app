import 'package:flutter/material.dart';

class ReviewStarsRow extends StatelessWidget {
  const ReviewStarsRow({
    super.key,
    required this.rating,
    this.size = 16,
    this.maxStars = 5,
  });

  final int rating;
  final double size;
  final int maxStars;

  @override
  Widget build(BuildContext context) {
    final int safeRating = rating.clamp(0, maxStars);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        maxStars,
        (index) => Icon(
          index < safeRating ? Icons.star_rounded : Icons.star_outline_rounded,
          size: size,
          color: const Color(0xFFF4A21D),
        ),
      ),
    );
  }
}
