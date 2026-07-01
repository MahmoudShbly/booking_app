import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/admin%20features/home/presentation/view/widgets/app_bar_section.dart';
import 'package:booking_app/features/admin%20features/home/presentation/view/widgets/coin_request_card.dart';
import 'package:flutter/material.dart';

import 'join_request.dart';
import 'stats_cards.dart';

class AdminHomeViewBody extends StatelessWidget {
  const AdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            AdminAppBarSection(),
            SizedBox(height: 24),
            UsersTypeCard(),
            SizedBox(height: 16),
            JoinRequest(),
            CoinsRequest(),
          ],
        ),
      ),
    );
  }
}

class CoinsRequest extends StatelessWidget {
  const CoinsRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'طلبات الشحن',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'عرض الكل',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xff003D9B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        CoinRequestCard(
          amount: '\$50.00',
          customerName: 'أحمد محمد',
          paymentMethod: 'تحويل بنكي - مباشر',
          transactionNumber: '#TRX-882914xxxxxxxxxxxxx444',
          onConfirm: () {},
          onReject: () {},
        ),
      ],
    );
  }
}
      