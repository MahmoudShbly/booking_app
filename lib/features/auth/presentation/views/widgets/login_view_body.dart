import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}
class _LoginViewBodyState extends State<LoginViewBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('نم نسجيل الدخول'), backgroundColor: Colors.green),
          );
        }

      },
      builder: (context, state) {
        final cubit = context.read<AuthCubit>();
        return Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
        );
      },
    );
  }
}
