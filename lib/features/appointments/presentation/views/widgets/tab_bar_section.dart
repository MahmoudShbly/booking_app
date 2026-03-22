import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/enums.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/appointments/presentation/manager/fetch%20my%20bookings/fetch_my_bookings_cubit.dart';
import 'package:booking_app/features/appointments/presentation/views/widgets/list_of_booking_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarSection extends StatefulWidget {
  const TabBarSection({super.key});

  @override
  State<TabBarSection> createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

@override
void initState() {
  super.initState();
  _controller = TabController(length: 3, vsync: this);

  WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<FetchMyBookingsCubit>().fetchMyBookings();
  });
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SizedBox(
            height: 48,
            child: TabBar(
              controller: _controller,
              dividerHeight: 0,
              indicatorPadding: const EdgeInsets.all(2),
              labelPadding: EdgeInsets.zero,
              indicator: BoxDecoration(
                color: kBlue,
                borderRadius: BorderRadius.circular(12),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: kBlue,
              tabs: [
                _buildTab('سابقة'),
                _buildTab('فعالة'),
                _buildTab('قيد الانتظار'),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: [
              ListOfBookingSection(status: BookingStatus.completed),
              ListOfBookingSection(status: BookingStatus.confirmed),
              ListOfBookingSection(status: BookingStatus.pending),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String title) {
    return Container(
      height: 42,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(color: kBlue, width: 1),
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: Text(title, style: Styles.textStyle16),
    );
  }
}
