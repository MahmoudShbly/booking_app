import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/auth/presentation/views/widgets/register_field_section.dart';
import 'package:flutter/material.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44.0,vertical: 132),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('إنشاء حساب جديد',style: Styles.textStyle30,),
          SizedBox(
            height: 16,
          ),
          const Text('انضم إلى مجتمعنا الراقي !',style: Styles.textStyle14,),
          const SizedBox(height: 32,),
          const RegisterFieldSection(),
        ],
      ),
    );
  }
}
