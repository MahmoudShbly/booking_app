import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFieldSection extends StatelessWidget {
  const RegisterFieldSection({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Container(
          width: double.infinity,
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
          child: Column(
            children: [
              CustomTextFormFieldComponent(
                hint: 'أدخل اسمك',
                fillColor: Color(0xffF1F4F3),
                controller: cubit.nameController,
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldComponent(
                hint: 'البريد الإلكتروني',
                type: TextInputType.emailAddress,
                fillColor: Color(0xffF1F4F3),
                controller: cubit.emailController,
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldComponent(
                hint: 'أدخل رقم هاتفك',
                type: TextInputType.phone,
                fillColor: Color(0xffF1F4F3),
                controller: cubit.phoneController,
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldComponent(
                hint: 'كلمة المرور',
                isObscure: true,
                fillColor: Color(0xffF1F4F3),
                controller: cubit.passwordController,
              ),
              const SizedBox(height: 16),
              CustomTextFormFieldComponent(
                hint: 'تأكيد كلمة المرور',
                isObscure: true,
                fillColor: Color(0xffF1F4F3),
                controller: cubit.confirmPasswordController,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: CustomButtonComponent(
                  isLoading: state is AuthLoading,
                  onTap: () {
                    cubit.register();
                  },
                  title: 'إنشاء حساب',
                  titleStyle: Styles.textStyle18.copyWith(color: Colors.white),
                  borderRadius: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
