import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/category_selection_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/custom_app_bar.dart';
import 'package:booking_app/features/services/presentation/views/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChooseCategoryView extends StatelessWidget {
  const ChooseCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BeProviderCubit, BeProviderState>(
        builder: (context, state) {
          var cubit = context.read<BeProviderCubit>();
          return Column(
            children: [
              const SizedBox(height: 40),
              CustomAppBar(),
              const SizedBox(height: 40),
              TitleSection(title: 'اختر نوع الخدمة التي تود تقديمها'),
              const SizedBox(height: 50),
              CategorySelectionSection(),
              CustomButtonComponent(
                title: "التالي",
                titleStyle: Styles.textStyle20.copyWith(color: Colors.white),
                borderRadius: 16,
                height: 60,
                width: 250,
                onTap: () => cubit.selectedIndex < 0
                    ? ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('يجب تحديد نوع الخدمة'),
                          backgroundColor: Colors.red,
                        ),
                      )
                    : GoRouter.of(
                        context,
                      ).push(AppRouter.kAboutYourServiceView),
              ),
            ],
          );
        },
      ),
    );
  }
}
