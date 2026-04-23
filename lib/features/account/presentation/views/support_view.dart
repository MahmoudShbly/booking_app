import 'package:booking_app/features/account/presentation/views/widgets/support_view_body.dart';
import 'package:flutter/material.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xFF134074)),
        title: const Text('المساعدة والدعم'),
        titleTextStyle: const TextStyle(
          color: Color(0xFF134074),
          fontSize: 24,
          fontWeight: FontWeight.w600,
          fontFamily: 'NotoSansArabic',
        ),
      ),
      body: const SupportViewBody(),
    );
  }
}
