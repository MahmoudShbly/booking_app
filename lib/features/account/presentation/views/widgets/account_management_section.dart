import 'package:booking_app/core/utils/app_dialog.dart';
import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/account/presentation/manager/logout/logout_cubit.dart';
import 'package:booking_app/features/account/presentation/views/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

class AccountManagementSection extends StatelessWidget {
  const AccountManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutSuccess && context.mounted) {
          GoRouter.of(context).go('/');
        }
        if (state is LogoutFailure && context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text('ادارة الحساب', style: Styles.textStyle20),
            SizedBox(height: 12),
            OptionCard(
              title: 'التفاصيل الشخصية',
              icon: FontAwesomeIcons.solidUser,
              onTap: () {},
            ),
            SizedBox(height: 8),
            OptionCard(
              title: 'المساعدة والدعم',
              icon: FontAwesomeIcons.solidCircleQuestion,
              onTap: () => GoRouter.of(context).push(AppRouter.kSupportView),
            ),
            SizedBox(height: 8),
            OptionCard(
              title: 'تسجيل الخروج',
              iconsColor: Color(0xffBA1A1A),
              icon: FontAwesomeIcons.rightFromBracket,
              onTap: () {
                showAppDialog(
                  context: context,
                  cancelText: 'لا',
                  confirmText: 'نعم',
                  confirmColor: Color(0xffBA1A1A),
                  cancelBorder: BoxBorder.all(color: kBlue),
                  title: const Text('تسجيل الخروج', style: Styles.textStyle18),
                  message: 'هل أنت متأكد أنك تريد تسجيل الخروج؟',
                  onConfirm: ()async {
                    await context.read<LogoutCubit>().logout();
                    if (context.mounted) {
                      GoRouter.of(context).pop();
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
