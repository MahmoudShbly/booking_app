import 'dart:ui';
import 'package:booking_app/core/utils/app_dialog.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/home/presentation/manager/book%20service/book_service_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookButton extends StatelessWidget {
  const BookButton({super.key, required this.serviceId});
  final int serviceId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookServiceCubit, BookServiceState>(
      builder: (context, state) {
        return ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white.withValues(alpha: 0.6),
              child: SizedBox(
                child: CustomButtonComponent(
                  borderRadius: 16,
                  title: 'احجز الان',
                  titleStyle: Styles.textStyle26.copyWith(color: Colors.white),
                  height: 55,
                  width: double.infinity,
                  onTap: () {
                    showAppDialog(
                      context: context,
                      title: Text('تأكيد طلب الحجز', style: Styles.textStyle26),
                      message: 'هل أنت متأكد من رغبتك في حجز هذه الخدمة؟',
                      
                      onConfirm: () {
                        GoRouter.of(context).pop();
                        context.read<BookServiceCubit>().bookService(serviceId);
                        showAppDialog(
                          context: context,
                          title: Text('تم تقديم الطلب',style: Styles.textStyle26),
                          message: state is BookServiceSuccess
                              ? 'تم إرسال طلب الحجز بنجاح، بانتظار تحديد التوقيت من مقدم الخدمة'
                              : 'حدث خطأ أثناء تقديم الطلب. يرجى المحاولة مرة أخرى.',
                          onConfirm: () {
                            GoRouter.of(context).pop();
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
