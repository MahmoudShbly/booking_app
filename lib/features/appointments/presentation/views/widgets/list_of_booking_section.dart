import 'package:booking_app/core/utils/enums.dart';
import 'package:booking_app/features/appointments/presentation/manager/fetch%20my%20bookings/fetch_my_bookings_cubit.dart';
import 'package:booking_app/features/appointments/presentation/views/widgets/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfBookingSection extends StatelessWidget {
  const ListOfBookingSection({super.key, required this.status});
  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchMyBookingsCubit, FetchMyBookingsState>(

      builder: (context, state) {
        if (state is FetchMyBookingsFailure) {
          return Center(child: Text(state.errorMessage));
        }
        
        if (state is FetchMyBookingsSuccess) {
          final filteredBookings = state.myBooking
              .where((booking) => booking.status == status.name)
              .toList();
          
          return filteredBookings.isEmpty? Center(
            child: Text('لا توجد مواعيد'),
          ):ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            itemCount: filteredBookings.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: AppointmentCard(booking: filteredBookings[index]),
            ),
          );
        }
        
        return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}