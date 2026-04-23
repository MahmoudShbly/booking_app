import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/account/presentation/views/widgets/contact_form_card.dart';
import 'package:booking_app/features/account/presentation/views/widgets/faq_tile.dart';
import 'package:booking_app/features/account/presentation/views/widgets/support_header_card.dart';
import 'package:flutter/material.dart';

class SupportViewBody extends StatelessWidget {
  const SupportViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SupportHeaderCard(),
          const SizedBox(height: 24),
          Text(
            'الأسئلة الأكثر شيوعاً',
            style: Styles.textStyle20.copyWith(
              color: const Color(0xFF163D69),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          const FaqTile(
            title: 'كيف يمكنني إجراء حجز جديد؟',
            answer:
                'من شاشة المواعيد اختر الحجز المطلوب ثم اضغط على زر إلغاء وأكد العملية.',
          ),
          const SizedBox(height: 8),
          const FaqTile(
            title: 'ما هي طرق الدفع المتاحة؟',
            answer:
                'يمكنك الدفع نقداً أو باستخدام وسائل الدفع الرقمية التي تظهر عند تأكيد الحجز.',
          ),
          const SizedBox(height: 8),
          const FaqTile(
            title: 'كيف يمكنني إلغاء حجزي؟',
            answer:
                'إذا كان الحجز ما زال قيد الانتظار يمكنك إلغاؤه مباشرة من تفاصيل الحجز.',
          ),
          const SizedBox(height: 24),
          Text(
            'راسلنا مباشرة',
            style: Styles.textStyle20.copyWith(
              color: const Color(0xFF163D69),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const ContactFormCard(),
        ],
      ),
    );
  }
}
