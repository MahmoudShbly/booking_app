import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:booking_app/features/home/presentation/views/widgets/home_body_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      'حجوزاتي',
                      style: Styles.textStyle40,
                    ),
                    SizedBox(height: 20),
                    CustomSearchBar(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: const HomeBodySection(),
          ),
        ],
      ),
    );
  }
}
