import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CoinRequestCard extends StatelessWidget {
  final String amount;
  final String customerName;
  final String paymentMethod;
  final String transactionNumber;
  final VoidCallback? onConfirm;
  final VoidCallback? onReject;

  const CoinRequestCard({
    super.key,
    required this.amount,
    required this.customerName,
    required this.paymentMethod,
    required this.transactionNumber,
    this.onConfirm,
    this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFC3C6D6)),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          _RequestDetails(
            customerName: customerName,
            paymentMethod: paymentMethod,
            transactionNumber: transactionNumber,
          ),
          const SizedBox(width: 16),
          _RequestActions(
            amount: amount,
            onConfirm: onConfirm,
            onReject: onReject,
          ),
        ],
      ),
    );
  }
}

class _RequestDetails extends StatelessWidget {
  final String customerName;
  final String paymentMethod;
  final String transactionNumber;

  const _RequestDetails({
    required this.customerName,
    required this.paymentMethod,
    required this.transactionNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFBFD1FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.account_balance_wallet_outlined,
              color: Color(0xFF485980),
              size: 16,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: Styles.textStyle14.copyWith(
                    color: const Color(0xFF191C1E),
                    fontWeight: FontWeight.w700,
                    height: 20 / 14,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
               Text('رقم العملية:',style: Styles.textStyle10.copyWith(color:const Color(0xFF434654),height: 16 / 11, ),),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    transactionNumber,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle10.copyWith(
                      fontSize: 11,
                      height: 16 / 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RequestActions extends StatelessWidget {
  final String amount;
  final VoidCallback? onConfirm;
  final VoidCallback? onReject;

  const _RequestActions({required this.amount, this.onConfirm, this.onReject});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            amount,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.textStyle16.copyWith(
              color: const Color(0xFF003D9B),
              fontWeight: FontWeight.w700,
              height: 24 / 16,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _ActionButton(
                label: 'تأكيد',
                foregroundColor: const Color(0xFF004E32),
                backgroundColor: const Color(0x33006844),
                onPressed: onConfirm,
              ),
              const SizedBox(width: 8),
              _ActionButton(
                label: 'رفض',
                foregroundColor: const Color(0xFFBA1A1A),
                backgroundColor: const Color(0x33FFDAD6),
                onPressed: onReject,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const _ActionButton({
    required this.label,
    required this.foregroundColor,
    required this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(2),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(2),
        child: SizedBox(
          height: 24,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: Text(
                label,
                style: Styles.textStyle12.copyWith(
                  color: foregroundColor,
                  fontWeight: FontWeight.w700,
                  height: 16 / 12,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
