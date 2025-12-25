import 'package:booking_app/core/utils/app_dialog.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/features/notification/presentation/views/widgets/custom_notification_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

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
            delegate: SliverChildBuilderDelegate((context, index) {
              return CustomNotificationCard(
                onTap: () {
                  showAppDialog(
                    context: context,
                    title: Text('تأكيد', style: Styles.textStyle26),
                    message:
                        'هل انت واثق من تأكيد حجزك لدى عيادة الرضوان علما انه سيتم خصم 2 نقطة كجزء من رسم الخدمة .',
                    confirmText: 'تأكيد',
                    confirmColor: Colors.green,
                    cancelText: 'الغاء',
                    onConfirm: () {
                      GoRouter.of(context).pop();
                      showAppDialog(
                        context: context,
                        title: Row(
                          children: <Widget>[
                             Text('تم تأكيد الحجز بنجاح ',style: Styles.textStyle26,),
                             Icon(FontAwesomeIcons.circleCheck,color: Colors.green,)
                          ],
                        ),
                        message: ' ',
                        onConfirm: (){GoRouter.of(context).pop();},
                      );
                    },
                  );
                },
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}
