import 'package:booking_app/features/auth/presentation/views/widgets/field_section.dart';
import 'package:booking_app/features/auth/presentation/views/widgets/top_banner_section.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
            IgnorePointer(child: const TopBannerSection()),
            Positioned(
              top: 300,
              left: 16,
              right: 16,
              child: FieldsSection(),
            ),
          ],
        ),
      ),
    );
  }
}


