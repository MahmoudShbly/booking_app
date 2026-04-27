import 'package:booking_app/core/utils/app_dialog.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/appointments/presentation/manager/cancel%20booking/cancel_booking_cubit.dart';
import 'package:booking_app/features/services/data/models/service%20provider/booking_request_model.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/complete%20booking/complete_booking_cubit.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/detect%20booking%20time%20cubit/detect_booking_time_cubit.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/fetch%20bookings%20request/fetch_booking_request_cubit.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/filter%20booking%20request/filter_booking_request_by_status_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookingActionButtons extends StatelessWidget {
  const BookingActionButtons({super.key, required this.request});

  static const String _pendingStatus = 'pending';
  static const String _confirmedStatus = 'confirmed';

  final BookingRequestModel request;

  bool get _isPending => request.status == _pendingStatus;

  bool get _isConfirmed => request.status == _confirmedStatus;

  String get _actionLabel {
    if (_isPending) {
      return 'رفض';
    }
    if (_isConfirmed) {
      return 'تمت';
    }
    return 'الغاء';
  }

  Color get _actionColor {
    return _isConfirmed ? const Color(0xFF4CAF50) : const Color(0xFFC43A3A);
  }

  void _showSnackBar(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: backgroundColor),
    );
  }

  Future<void> _onAcceptPressed(BuildContext context) async {
    final DetectBookingTimeCubit cubit = context.read<DetectBookingTimeCubit>();
    await cubit.selectTime(context);
    if (!context.mounted || cubit.time.isEmpty) {
      return;
    }
    await cubit.detectBookingTime(bookingRequestId: request.id);
  }

  Future<void> _onCompletePressed(BuildContext context) async {
    await context.read<CompleteBookingCubit>().completeBooking(
      bookingRequestId: request.id,
    );
  }

  Future<void> _onCancelConfirmed(BuildContext context) async {
    await context.read<CancelBookingCubit>().cancelBooking(request.id);
    if(context.mounted){
    final FilterBookingRequestByStatusCubit filterCubit = context
        .read<FilterBookingRequestByStatusCubit>();

    context.read<FetchBookingRequestCubit>().fetchBookingRequests(
      status: filterCubit.eBookingsStatus[filterCubit.selectedFilterIndex],
    );

   
      GoRouter.of(context).pop();
    }
  }

  void _showCancelDialog(BuildContext context) {
    showAppDialog(
      context: context,
      title: const Text('الغاء الحجز'),
      message: 'هل انت متاكد من رغبتك في الغاء مواعدك ',
      onConfirm: () => _onCancelConfirmed(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetectBookingTimeCubit, DetectBookingTimeCubitState>(
      listener: (context, state) {
        if (state is DetectBookingTimeCubitSuccess) {
          _showSnackBar(
            context,
            message: state.message,
            backgroundColor: Colors.green,
          );
        }
        if (state is DetectBookingTimeCubitFailure) {
          _showSnackBar(
            context,
            message: state.message,
            backgroundColor: Colors.red,
          );
        }
      },
      builder: (context, state) {
        final bool isLoading =
            state is DetectBookingTimeCubitLoading &&
            state.bookingRequestId == request.id;
        return Row(
          children: <Widget>[
            if (_isPending)
              Expanded(
                child: ElevatedButton(
                  onPressed: isLoading ? null : () => _onAcceptPressed(context),
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
            if (_isPending) const SizedBox(width: 8),
            Expanded(
              child: BlocConsumer<CompleteBookingCubit, CompleteBookingState>(
                listener: (context, completeState) {
                  if (completeState is CompleteBookingSuccess) {
                    _showSnackBar(
                      context,
                      message: completeState.message,
                      backgroundColor: Colors.green,
                    );
                  }
                  if (completeState is CompleteBookingFailure) {
                    _showSnackBar(
                      context,
                      message: completeState.message,
                      backgroundColor: Colors.red,
                    );
                  }
                },
                builder: (context, completeState) {
                  final bool isCompleteLoading =
                      completeState is CompleteBookingLoading &&
                      completeState.bookingRequestId == request.id;
                  final bool canComplete =
                      _isConfirmed && !isLoading && !isCompleteLoading;
                  final bool canCancel =
                      !_isConfirmed && !isLoading && !isCompleteLoading;

                  return OutlinedButton(
                    onPressed: canComplete
                        ? () => _onCompletePressed(context)
                        : canCancel
                        ? () => _showCancelDialog(context)
                        : null,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _actionColor,
                      disabledForegroundColor: _actionColor,
                      side: BorderSide(color: _actionColor),
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
                        : Text(_actionLabel),
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
