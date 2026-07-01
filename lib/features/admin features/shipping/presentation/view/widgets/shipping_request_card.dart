import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ShippingRequestCard extends StatelessWidget {
  const ShippingRequestCard({super.key, required this.request});

  final ShippingRequestData request;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE1E2E4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: NetworkImage(request.imageUrl),
                backgroundColor: const Color(0xFFD8E2FF),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            request.name,
                            style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF191C1E),
                            ),
                          ),
                        ),
                        Text(
                          request.amount,
                          style: Styles.textStyle16.copyWith(
                            color: const Color(0xFF003D9B),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      request.paymentMethod,
                      style: Styles.textStyle14.copyWith(
                        color: const Color(0xFF434654),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'رقم العملية: ${request.transactionNumber}',
                      style: Styles.textStyle12.copyWith(
                        color: const Color(0xFF737685),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFEDEEF0), thickness: 1),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _ActionButton(
                  label: 'تأكيد',
                  backgroundColor: const Color(0xFFE7F5ED),
                  foregroundColor: const Color(0xFF004E32),
                  icon: Icons.check_circle_outline,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _ActionButton(
                  label: 'رفض',
                  backgroundColor: const Color(0xFFFFF0F0),
                  foregroundColor: const Color(0xFFBA1A1A),
                  icon: Icons.cancel_outlined,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.icon,
  });

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: foregroundColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: Styles.textStyle14.copyWith(
              color: foregroundColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class ShippingRequestData {
  const ShippingRequestData({
    required this.name,
    required this.paymentMethod,
    required this.transactionNumber,
    required this.amount,
    required this.imageUrl,
  });

  final String name;
  final String paymentMethod;
  final String transactionNumber;
  final String amount;
  final String imageUrl;
}
