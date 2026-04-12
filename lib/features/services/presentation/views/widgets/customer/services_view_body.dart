import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/utils/temp.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesViewBody extends StatelessWidget {
  const ServicesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomAppBarComponent(
          myWidget: Text('خدماتي', style: Styles.textStyle40),
        ),
        SliverFillRemaining(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(Temp.tempImage4),
              const SizedBox(height: 20),
              Text('هل ترغب بان تصبح مقدم  خدمة ؟', style: Styles.textStyle20),
              SizedBox(height: 70),
              CustomButtonComponent(
                title: 'نعم',
                titleStyle: Styles.textStyle20.copyWith(color: Colors.white),
                height: 40,
                width: 140,
                borderRadius: 10,
                onTap: () => GoRouter.of(context).push(AppRouter.kChooseCategoryView),
                
              ),
            ],
          ),
        ),
      ],
    );
  }
}
