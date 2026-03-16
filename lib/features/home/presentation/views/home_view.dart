import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20categories/fetch_categories_cubit.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20services/fetch_services_cubit.dart';
import 'package:booking_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:booking_app/features/home/presentation/views/widgets/home_body_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
           await Future.wait([
            context.read<FetchCategoriesCubit>().fetchCategories(),
            context.read<FetchServicesCubit>().fetchServices(),
          ]);
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kBlue,
              expandedHeight: 180,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Text('حجوزاتي', style: Styles.textStyle40),
                      SizedBox(height: 20),
                      CustomSearchBar(),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: const HomeBodySection()),
          ],
        ),
      ),
    );
  }
}
