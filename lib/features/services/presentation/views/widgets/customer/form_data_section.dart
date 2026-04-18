import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/services/presentation/manager/customer/be%20provider/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/customer/available_days_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/customer/available_hours_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/customer/buttons_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/customer/choose_city_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/customer/price_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/customer/time_picker_box_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/customer/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FormDataSection extends StatefulWidget {
  const FormDataSection({super.key});

  @override
  State<FormDataSection> createState() => _FormDataSectionState();
}

class _FormDataSectionState extends State<FormDataSection> {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        BeProviderCubit cubit = context.read<BeProviderCubit>();
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TitleSection(title: 'اسم الخدمة'),
              CustomTextFormFieldComponent(
                hint: 'اسم الخدمة الذي سيظهر عند المستخدم',
                controller: cubit.serviceName,
              ),
              const SizedBox(height: 20),
              TitleSection(title: 'الوصف'),
              CustomTextFormFieldComponent(
                hint: 'وصف الخدمة التي تقدمها',
                controller: cubit.serviceDescription,
              ),
              const SizedBox(height: 20),
              TitleSection(title: 'المدينة'),
              const SizedBox(height: 20),
              ChooseCitySection(),
              const SizedBox(height: 20),
              TitleSection(title: 'الموقع'),
              CustomTextFormFieldComponent(
                hint: 'موقع الخدمة ',
                controller: cubit.serviceLocation,
              ),
              const SizedBox(height: 20),
              TitleSection(title: 'الزمن اللازم لاتمام الخدمة'),
              TimePickerBoxSection(),
              TitleSection(title: 'ايام الخدمة المتاحة'),
              const SizedBox(height: 20),
              AvailableDaysSection(),
              const SizedBox(height: 30),
              TitleSection(title: 'ساعات الخدمة المتاحة'),
              AvailableHoursSection(),
              const SizedBox(height: 20),
              PriceSection(
                bookPriceController: cubit.bookPrice,
                fullPriceController: cubit.fullPrice,
              ),
              const SizedBox(height: 30),
              ButtonsSection(next: () =>formKey.currentState!.validate() ? GoRouter.of(context).push(AppRouter.kUploadImagesView) : null,),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
