import 'package:booking_app/core/utlis/constant.dart';
import 'package:booking_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
        TopBannerSection(),
      ],
    );
  }
}

class TopBannerSection extends StatelessWidget {
  const TopBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(color: kBlue,),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
             SizedBox(
               height: 50,
             ),
             Text('حـجـوزاتي',style: Styles.textStyle40.copyWith(color: Colors.white),)
          ],
        ),
      ),
      );
  }
}
