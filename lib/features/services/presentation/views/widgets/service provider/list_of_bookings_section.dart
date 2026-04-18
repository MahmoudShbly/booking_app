import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/fetch%20bookings%20request/fetch_booking_request_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/booking_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfBookingsSection extends StatelessWidget {
  const ListOfBookingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBookingRequestCubit, FetchBookingRequestState>(
      builder: (context, state) {
        if (state is FetchBookingRequestLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is FetchBookingRequestFailure) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              state.errorMessage,
              textAlign: TextAlign.center,
              style: Styles.textStyle12.copyWith(color: Colors.red.shade700),
            ),
          );
        }

        if (state is FetchBookingRequestSuccess) {
          if (state.requests.isEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'لا يوجد طلبات حالياً',
                textAlign: TextAlign.center,
                style: Styles.textStyle12.copyWith(
                  color: const Color(0xFF5A6472),
                ),
              ),
            );
          }

          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return BookingRequestCard(request: state.requests[index]);
            },
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: 10);
            },
            itemCount: state.requests.length,
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
