import 'package:booking_app/features/account/presentation/manager/account_cubit.dart';
import 'package:booking_app/features/account/presentation/views/account_view.dart';
import 'package:booking_app/features/appointments/presentation/views/appointments_view.dart';
import 'package:booking_app/features/home/presentation/views/home_view.dart';
import 'package:booking_app/features/main/presentation/views/widgets/bottom_nav_bar_items.dart';
import 'package:booking_app/features/notification/presentation/views/notification_view.dart';
import 'package:booking_app/features/services/presentation/views/customer/services_view.dart';
import 'package:booking_app/features/services/presentation/views/service%20provider/service_provider_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static PersistentTabController controller = PersistentTabController(
    initialIndex: 0,
  );
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        final role =
            state is AccountLoaded ? state.userData.role.toLowerCase() : '';
        final isProvider = role == 'provider';

        List<Widget> screens = [
          HomeView(),
          AppointmentsView(),
          isProvider ? ServiceProviderView() : CustomerServicesView(),
          NotificationView(),
          AccountView(),
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
      },
    );
  }
}

