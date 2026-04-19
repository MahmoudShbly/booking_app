import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/filter%20booking%20request/filter_booking_request_by_status_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/booking_status_filter_chip.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/list_of_bookings_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingsManagementSection extends StatelessWidget {
  const BookingsManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBookingRequestByStatusCubit, FilterBookingRequestByStatusState>(
      builder: (context,state) {
        final cubit = context.read<FilterBookingRequestByStatusCubit>();

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
                    context.read<FilterBookingRequestByStatusCubit>().selectFilter(index,context );
                  },
                );
              }),
            ),
            const SizedBox(height: 14),
            const ListOfBookingsSection(),
          ],
        );
      },
    );
  }
}
