import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:booking_app/features/home/presentation/views/widgets/home_body_section.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomAppBarComponent(
            myWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'حـجـوزاتي',
              style: Styles.textStyle40.copyWith(color: Colors.white),
            ),
            SizedBox(
              height: 26,
            ),
            CustomSearchBar(),
          ],
        ),),
          SizedBox(height: 12),
          Expanded(child: HomeBodySection()),
        ],
      ),
    );
  }
}
