import 'package:booking_app/features/appointments/presentation/views/appointments_view.dart';
import 'package:booking_app/features/home/presentation/views/home_view.dart';
import 'package:booking_app/features/main/presentation/views/widgets/bottom_nav_bar_items.dart';
import 'package:booking_app/features/notification/presnetation/views/notfication_view.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      HomeView(),
      AppointmentsView(),
      Container(color: Colors.yellow),
      NotificationView(),
      Container(color: Colors.red),
    ];

    return Scaffold(
      body: PersistentTabView(
        navBarHeight: 70,
        margin: EdgeInsets.only(bottom: 12),
        padding: NavBarPadding.all(1),

        context,
        controller: controller,
        screens: screens,
        items: navBarItems,
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
         
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}

