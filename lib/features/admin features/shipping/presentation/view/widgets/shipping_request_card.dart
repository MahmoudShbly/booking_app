import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/admin%20features/shipping/presentation/manager/fetch%20topups/fetch_topups_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingRequestCard extends StatelessWidget {
  const ShippingRequestCard({super.key, required this.request});

  final ShippingRequestData request;

  void _showSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchTopupsCubit, FetchTopupsState>(
      listener: (context, state) {
        if (!context.mounted) {
          return;
        }

        if (state is FetchTopupsApproveSuccess) {
          _showSnackBar(context, state.message, Colors.green);
        }

        if (state is FetchTopupsApproveFailure) {
          _showSnackBar(context, state.errorMessage, Colors.red);
        }
      },
      child: BlocBuilder<FetchTopupsCubit, FetchTopupsState>(
        builder: (context, state) {
          final bool isLoading =
              state is FetchTopupsApproveLoading && state.topupId == request.id;

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
                        isLoading: isLoading,
                        onPressed: () {
                          context.read<FetchTopupsCubit>().approveTopup(
                            topupId: request.id,
                          );
                        },
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
        },
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
    this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData icon;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Icon(icon, size: 16, color: foregroundColor),
            const SizedBox(width: 6),
            Text(
              isLoading ? 'جاري...' : label,
              style: Styles.textStyle14.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShippingRequestData {
  const ShippingRequestData({
    required this.id,
    required this.name,
    required this.paymentMethod,
    required this.transactionNumber,
    required this.amount,
    required this.imageUrl,
  });

  final int id;
  final String name;
  final String paymentMethod;
  final String transactionNumber;
  final String amount;
  final String imageUrl;
}
