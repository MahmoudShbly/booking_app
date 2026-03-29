import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FieldsSection extends StatefulWidget {
  const FieldsSection({super.key});

  @override
  State<FieldsSection> createState() => _FieldsSectionState();
}

class _FieldsSectionState extends State<FieldsSection> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('نم نسجيل الدخول'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 3,
                offset: const Offset(5, 10),
              ),
            ],
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: const Text('تسجيل الدخول', style: Styles.textStyle20),
                ),
                CustomTextFormFieldComponent(
                  hint: 'البريد الالكتروني',
                  controller: cubit.emailController,
                  type: TextInputType.emailAddress,
                ),
                CustomTextFormFieldComponent(
                  hint: 'كلمة المرور',
                  controller: cubit.passwordController,
                  type: TextInputType.visiblePassword,
                  isObscure: true,
                ),
                CustomButtonComponent(
                  title: 'تسجيل الدخول',
                  titleStyle: Styles.textStyle18.copyWith(color: Colors.white),
                  borderRadius: 12,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      cubit.login();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}