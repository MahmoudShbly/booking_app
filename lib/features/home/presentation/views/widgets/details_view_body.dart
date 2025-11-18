
import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/core/utlis/temp.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/home/presentation/views/widgets/about_service_section.dart';
import 'package:booking_app/features/home/presentation/views/widgets/rating.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ),SizedBox(
            height: 26,
          ),
          ReviewRatingSection(),
        ],
      ),
    );
  }
}

class ReviewRatingSection extends StatelessWidget {
  const ReviewRatingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'التعليقات',
          style: Styles.textStyle20.copyWith(color: Colors.grey),
        ),
        SizedBox(height: 12),
        ListView.separated(
          separatorBuilder: (context, index) =>Container(height: 1,color: Colors.grey.shade300,) ,
          itemBuilder: (context, index) => CustomReviewCard(),
          itemCount: 3,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }
}

class CustomReviewCard extends StatelessWidget {
  const CustomReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[CircleAvatar(child: Image.asset(Temp.tempImage)),
            SizedBox(
              width: 12,
            ),
            const Text('محمود الشلبي',style: Styles.textStyle20,),
            Spacer(),
            Rating(starCount: 4),
      
      
            ]
          ),
           Text('عيادة رائعة لكن يخرج الطبيب مسرعا ولا ياخذ استشارات تبا له',style: Styles.textStyle20.copyWith(fontWeight: FontWeight.normal),maxLines: 2,overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}


