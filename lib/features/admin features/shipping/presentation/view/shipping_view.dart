import 'package:booking_app/features/admin%20features/shipping/data/repos/shipping_repo_impl.dart';
import 'package:booking_app/features/admin%20features/shipping/presentation/manager/fetch%20topups/fetch_topups_cubit.dart';
import 'package:booking_app/features/admin%20features/shipping/presentation/view/widgets/shipping_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingView extends StatelessWidget {
  const ShippingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchTopupsCubit(ShippingRepoImpl())..fetchTopups(),
      child: const Scaffold(body: ShippingViewBody()),
    );
  }
}
