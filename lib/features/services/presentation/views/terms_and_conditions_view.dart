import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<BeProviderCubit, BeProviderState>(
          builder: (context, state) {
            final cubit = context.read<BeProviderCubit>();
            return Column(
              children: <Widget>[
                SizedBox(height: 32),
                CustomAppBar(),
                Text(
                  'شروط و قوانين يجب معرفتها قبل اتمام اجراء التسجيل:',
                  style: Styles.textStyle26,
                ),
                SizedBox(height: 32),
                Expanded(
                  child: Text(
                    '1. يجب تقديم معلومات صحيحة ودقيقة أثناء عملية التسجيل.\n\n'
                    '2. يجب احترام خصوصية العملاء وعدم مشاركة معلوماتهم مع أطراف ثالثة بدون موافقتهم.\n\n'
                    '3. يتحمل المزود المسؤولية الكاملة عن جودة الخدمة المقدمة والتزامه بالمواعيد المحددة.\n\n'
                    '4.  يتم سحب الخدمة في حال مخالفة أي من الشروط المذكورة.\n\n',
                    style: Styles.textStyle20,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      activeColor: Colors.green,
                      hoverColor: Colors.grey,
                      value: cubit.isTermsAccepted,
                      onChanged: cubit.toggleTermsAccepted,
                    ),
                    Text(
                      'أوافق على الشروط المذكورة أعلاه.',
                      style: Styles.textStyle18,
                    ),
                  ],
                ),
                SizedBox(height: 24),
                CustomButtonComponent(
                  title: "التالي",
                  color: cubit.isTermsAccepted ? kBlue : Colors.grey,
                  titleStyle: Styles.textStyle20.copyWith(color: Colors.white),
                  borderRadius: 16,
                  height: 60,
                  width: 250,
                ),
                SizedBox(height: 48),
              ],
            );
          },
        ),
      ),
    );
  }
}
