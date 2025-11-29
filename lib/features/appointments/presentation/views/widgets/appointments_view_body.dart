import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/features/appointments/presentation/views/widgets/tab_bar_section.dart';
import 'package:flutter/material.dart';

class AppointmentsViewBody extends StatefulWidget {
  const AppointmentsViewBody({super.key});

  @override
  State<AppointmentsViewBody> createState() => _AppointmentsViewBodyState();
}

class _AppointmentsViewBodyState extends State<AppointmentsViewBody>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          CustomAppBarComponent(
            myWidget: Text(
              'مواعيدي',
              style: Styles.textStyle40.copyWith(color: Colors.white),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: TabBarSection(),
      ),
    );
  }
}
