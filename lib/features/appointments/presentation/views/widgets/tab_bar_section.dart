import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/appointments/presentation/views/widgets/appointment_card.dart';
import 'package:flutter/material.dart';

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
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: AppointmentCard(isDone: true,),
                ),
                itemCount: 10,
              ),
              ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: AppointmentCard(),
                ),
                itemCount: 5,
              ),
             ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: AppointmentCard(),
                ),
                itemCount: 5,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildTab(String title) {
    return Container(
      height: 42,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        border: Border.all(
          color: kBlue,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      alignment: Alignment.center,
      child: Text(title, style: Styles.textStyle16),
    );
  }
}