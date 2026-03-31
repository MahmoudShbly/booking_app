import 'package:booking_app/core/utils/scure_storage_services.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/account/presentation/views/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

class AccountManagementSection extends StatelessWidget {
  const AccountManagementSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onTap: () {},
          ),
          SizedBox(height: 8),
          OptionCard(
            title: 'تسجيل الخروج',
            iconsColor: Color(0xffBA1A1A),
            icon: FontAwesomeIcons.rightFromBracket,
            onTap: () async{ 
              GoRouter.of(context).go('/');
              final storage = ScureStorageServices();
              await storage.clearAuthData();
            },
          ),
        ],
      ),
    );
  }
}
