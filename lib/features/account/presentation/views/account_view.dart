import 'package:booking_app/features/account/presentation/views/widgets/account_view_body.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AccountViewBody(),
    );
  }
}