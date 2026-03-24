import 'package:booking_app/core/utils/app_dialog.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/appointments/data/models/booking_model.dart';
import 'package:booking_app/features/appointments/presentation/manager/cancel%20booking/cancel_booking_cubit.dart';
import 'package:booking_app/features/appointments/presentation/manager/fetch%20my%20bookings/fetch_my_bookings_cubit.dart';
import 'package:booking_app/features/appointments/presentation/views/widgets/comment_rating_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TextButtonSection extends StatelessWidget {
  const TextButtonSection({
    super.key,
    required this.isDone,
    required this.booking,
  });
  final bool isDone;
  final BookingModel booking;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CancelBookingCubit, CancelBookingState>(
      listener: (context, state) {
        if (state is CancelBookingSuccess) {

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.successMessage),
              backgroundColor: Colors.green,
            ),
          );
          context.read<FetchMyBookingsCubit>().fetchMyBookings();
        }
        if (state is CancelBookingFailure) {
          
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }

       
      },
      builder: (context, state) {
        if (state is CancelBookingLoading){
          
          return Center(
            child: CircularProgressIndicator(),
          );
        }else
        {return TextButton(
          onPressed: () {
            if (!isDone) {
              showAppDialog(
                context: context,
                title: Text('تأكيد', style: Styles.textStyle26),
                message:
                    'هل انت متاكد من رغبتك في الغاء مواعدك مع ${booking.service.name} في الساعة ${booking.scheduledAt} علما انه لا يمكنك استرجاع رسوم الحجز في حال تاكيده من قبل صاحب الخدمة',
                onConfirm: () {
                  context.read<CancelBookingCubit>().cancelBooking(booking);
                  GoRouter.of(context).pop();
                },
                cancelText: 'رجوع',
                confirmText: 'نعم',
                confirmBorder: Border.all(color: Colors.red),
                confirmColor: Colors.red,
              );
            }
            if (isDone) {
              showAppDialog(
                context: context,
                title: Text('تقييم الخدمة', style: Styles.textStyle26),
                message: 'يرجى تقييم خدمتك المقدمة من عيادة الرضوان',
                content: const CommentRatingSection(),
                cancelText: 'رجوع',
                confirmText: 'تقييم',
                onConfirm: () {},
              );
            }
          },
          child: Container(
            width: 80,
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: isDone ? Colors.amber : Colors.red),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                isDone ? 'تقييم' : 'الغاء',
                style: Styles.textStyle18.copyWith(
                  color: isDone ? Colors.black : Colors.red,
                ),
              ),
            ),
          ),
        );}
      },
    );
  }
}
