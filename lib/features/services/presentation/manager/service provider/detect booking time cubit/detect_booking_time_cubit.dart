import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'detect_booking_time_state.dart';

class DetectBookingTimeCubit extends Cubit<DetectBookingTimeCubitState> {
  DetectBookingTimeCubit(this.providerRepo) : super(DetectBookingTimeCubitInitial());
  final ProviderRepoImpl providerRepo;
    
     String time = '' ;
    Future<void> selectTime(
    BuildContext context,
  ) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      barrierDismissible: false,
      helpText: 'حدد وقت الحجز',
       cancelText: 'الغاء',
       confirmText: 'تأكيد',
       errorInvalidText: 'وقت غير صالح',
       hourLabelText: 'ساعة',
       minuteLabelText: 'دقيقة',
       useRootNavigator: false,
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (selectedTime != null&& context.mounted) {
      time = selectedTime.format(context);
    }
  }

  Future<void> detectBookingTime({
    required int bookingRequestId,
  }) async {
    emit(DetectBookingTimeCubitLoading(bookingRequestId: bookingRequestId));
    final result = await providerRepo.detectBookingTime(
      bookingRequestId: bookingRequestId,
      time: time,
    );

    result.fold(
      (failure) => emit(DetectBookingTimeCubitFailure(message: failure.errorMessage)),
      (message) => emit(DetectBookingTimeCubitSuccess(message: message)),
    );
    time = '';
  }
}
