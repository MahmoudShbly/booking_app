import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/features/account/presentation/views/widgets/image_section.dart';
import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kBlue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
        ),
        Positioned(right: 80, top: 100, child: ImageSection()),
      ],
    );
  }
}
