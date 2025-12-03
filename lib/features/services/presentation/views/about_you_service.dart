import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/days_dropdown_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/time_picker_box_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class AboutYourServiceView extends StatelessWidget {
  const AboutYourServiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        final cubit = context.read<BeProviderCubit>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(FontAwesomeIcons.arrowRight),
              color: kBlue,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TitleSection(title: 'اسم الخدمة'),
                  CustomTextFormFieldComponent(
                    hint: 'اسم الخدمة الذي سيظهر عند المستخدم',
                  ),
                  SizedBox(height: 20),
                  TitleSection(title: 'الموقع'),
                  CustomTextFormFieldComponent(hint: 'موقع الخدمة '),
                  SizedBox(height: 20),
                  TitleSection(title: 'الزمن اللازم لاتمام الخدمة'),
                  TimePickerBoxSection(),
                  TitleSection(title: 'ساعات الخدمة المتاحة'),
                  DaysDropdownSection(
                    items: cubit.days,
                    onChanged: (day)=>cubit.changeFromDay(day),
                    value: cubit.fromDay,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


