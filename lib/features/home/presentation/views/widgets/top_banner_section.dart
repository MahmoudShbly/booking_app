import 'package:booking_app/core/utlis/constant.dart';
import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/features/home/presentation/views/widgets/custom_search_bar.dart';
import 'package:flutter/material.dart';

class TopBannerSection extends StatelessWidget {
  const TopBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBlue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
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
        ),
      ),
    );
  }
}
