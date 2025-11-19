import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/core/utlis/temp.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/home/presentation/views/widgets/about_service_section.dart';

import 'package:booking_app/features/home/presentation/views/widgets/review_rating_section.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        
        SizedBox(
          height: size.height*.4,
          child: ListView.builder(
            itemBuilder: (context, index) =>
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Image.asset(Temp.tempImage3,width: size.width*1,fit: BoxFit.cover,),
                ),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AboutServiceSection(),
              SizedBox(height: 50),
              CustomButtonComponent(
                borderRadius: 16,
                title: 'احجز الان',
                titleStyle: Styles.textStyle26.copyWith(color: Colors.white),
                height: 55,
                width: 200,
              ),
              SizedBox(height: 26),
              ReviewRatingSection(),
            ],
          ),
        ),
      ],
    );
  }
}

