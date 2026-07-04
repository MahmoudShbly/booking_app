import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/admin%20features/home/data/repos/admin_home_repo_impl.dart';
import 'package:booking_app/features/admin%20features/home/presentation/manager/fetch%20users/fetch_users_cubit.dart';
import 'package:booking_app/features/admin%20features/home/presentation/view/widgets/app_bar_section.dart';
import 'package:booking_app/features/admin%20features/home/presentation/view/widgets/coin_request_card.dart';
import 'package:booking_app/features/admin%20features/providers/data/repos/providers_repo_impl.dart';
import 'package:booking_app/features/admin%20features/providers/presentation/manager/fetch%20not%20accepted%20services/fetch_not_accepted_services_cubit.dart';
import 'package:booking_app/features/user%20features/home/data/repos/home_repo_impl.dart';
import 'package:booking_app/features/user%20features/home/presentation/manager/fetch%20services/fetch_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'join_request.dart';
import 'stats_cards.dart';

class AdminHomeViewBody extends StatelessWidget {
  const AdminHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchServicesCubit(HomeRepoImpl())..fetchServices(),
        ),
        BlocProvider(
          create: (context) =>
              FetchNotAcceptedServicesCubit(ProvidersRepoImpl())
                ..fetchNotAcceptedServices(),
        ),
        BlocProvider(
          create: (context) => FetchUsersCubit(AdminHomeRepoImpl())..fetchUsers(),
        ),
      ],
      child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AdminAppBarSection(),
                const SizedBox(height: 24),
                const UsersTypeCard(),
                const SizedBox(height: 16),
                BlocBuilder<FetchNotAcceptedServicesCubit, FetchNotAcceptedServicesState>(
                  builder: (context, state) {
                    return JoinRequest(state: state);
                  },
                ),
                const CoinsRequest(),
              ],
            ),
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
