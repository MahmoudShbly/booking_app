import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/features/notification/presnetation/views/widgets/custom_notification_card.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          const CustomAppBarComponent(
            myWidget: Text('اشعارات', style: Styles.textStyle40),
          ),
        ];
      },
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('هذا الاسبوع', style: Styles.textStyle20),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: CustomNotificationCard(),
                );
              },
              childCount: 10, 
            ),
          ),
        ],
      ),
    );
  }
}

