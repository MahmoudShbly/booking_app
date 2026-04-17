import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/manager/fetch%20service%20into/fetch_service_info_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/booking_request_card.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/booking_status_filter_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsManagementSection extends StatelessWidget {
  const BookingsManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchServiceInfoCubit, FetchServiceInfoState>(
      builder: (BuildContext context, FetchServiceInfoState state) {
        final cubit = context.read<FetchServiceInfoCubit>();
    
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'إدارة الحجوزات',
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  'عرض الكل',
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF5A6472),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(cubit.bookingsStatus.length, (
                int index,
              ) {
                final bool isSelected = cubit.selectedFilterIndex == index;
                return BookingStatusFilterChip(
                  isSelected: isSelected,
                  title: cubit.bookingsStatus[index],
                  onTap: () {
                    context.read<FetchServiceInfoCubit>().selectFilter(index);
                  },
                );
              }),
            ),
            const SizedBox(height: 14),
            ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return BookingRequestCard(
                  request: cubit.bookingRequests[index],
                );
              },
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
              itemCount: cubit.bookingRequests.length,
            ),
          ],
        );
      },
    );
  }
}
