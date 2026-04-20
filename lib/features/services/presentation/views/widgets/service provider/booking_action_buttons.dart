import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/complete%20booking/complete_booking_cubit.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/detect%20booking%20time%20cubit/detect_booking_time_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingActionButtons extends StatelessWidget {
  const BookingActionButtons({super.key, required this.request});

  final BookingRequestModel request;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetectBookingTimeCubit, DetectBookingTimeCubitState>(
      listener: (context, state) {
        if (state is DetectBookingTimeCubitSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
        }
        if (state is DetectBookingTimeCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message), backgroundColor: Colors.red),
          );
        }
      },
      builder: (context, state) {
        final bool isLoading = state is DetectBookingTimeCubitLoading && state.bookingRequestId == request.id;
        return Row(
          children: <Widget>[
            if (request.status == 'pending')
              Expanded(
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final cubit = context.read<DetectBookingTimeCubit>();
                          await cubit.selectTime(context);
                          if (!context.mounted || cubit.time.isEmpty) {
                            return;
                          }
                          await cubit.detectBookingTime(
                            bookingRequestId: request.id,
                          );
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0F2E57),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size.fromHeight(28),
                    textStyle: Styles.textStyle10.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  child: isLoading
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Text('قبول'),
                ),
              ),
            if (request.status == 'pending') const SizedBox(width: 8),
            Expanded(
              child: BlocConsumer<CompleteBookingCubit, CompleteBookingState>(
                listener: (context, completeState) {
                  if (completeState is CompleteBookingSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(completeState.message),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                  if (completeState is CompleteBookingFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(completeState.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, completeState) {
                  final bool isCompleteLoading =
                      completeState is CompleteBookingLoading && completeState.bookingRequestId == request.id;
                  final Color actionColor = request.status == 'confirmed'
                    ? const Color(0xFF4CAF50)
                    : const Color(0xFFC43A3A);

                  return OutlinedButton(
                    onPressed: request.status == 'confirmed' && !isLoading && !isCompleteLoading
                        ? () async {
                            await context.read<CompleteBookingCubit>().completeBooking(
                                  bookingRequestId: request.id,
                                );
                          }
                        : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: actionColor,
                      disabledForegroundColor: actionColor,
                      side: BorderSide(
                        color: actionColor,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size.fromHeight(28),
                      textStyle: Styles.textStyle10.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: isCompleteLoading
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.green,
                            ),
                          )
                        : Text(
                            request.status == 'pending'
                                ? 'رفض'
                                : request.status == 'confirmed'
                                ? 'تمت'
                                : 'الغاء',
                          ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
