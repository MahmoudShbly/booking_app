import 'package:booking_app/features/account/presentation/views/widgets/account_management_section.dart';
import 'package:booking_app/features/account/presentation/views/widgets/app_bar_section.dart';
import 'package:booking_app/features/account/presentation/views/widgets/information_section.dart';
import 'package:booking_app/features/account/presentation/views/widgets/point_card_section.dart';
import 'package:flutter/material.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          AppBarSection(),
          SizedBox(height: 100),
          InformationSection(),
          SizedBox(height: 16),
          PointCardSection(),
          SizedBox(height: 24),
          AccountManagementSection(),
        ],
      ),
    );
  }
}
