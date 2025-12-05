import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/widgets/custom_text_form_field_component.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/available_days_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/available_hours_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/buttons_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/price_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/time_picker_box_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class AboutYourServiceView extends StatefulWidget {
  const AboutYourServiceView({super.key});

  @override
  State<AboutYourServiceView> createState() => _AboutYourServiceViewState();
}

class _AboutYourServiceViewState extends State<AboutYourServiceView> {
  late TextEditingController serviceName;
  late TextEditingController serviceLocation;
  late TextEditingController timeToComplete;
  late TextEditingController firstTime;
  late TextEditingController lastTime;
  late TextEditingController bookPrice;
  late TextEditingController fullPrice;
  Future<void> selectTime(TextEditingController controller) async {
  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (!mounted) return;

  if (selectedTime != null) {
    controller.text = selectedTime.format(context);
  }
}

  @override
  void initState() {
    serviceName = TextEditingController();
    serviceLocation = TextEditingController();
    timeToComplete = TextEditingController();
    bookPrice = TextEditingController();
    fullPrice = TextEditingController();
    firstTime = TextEditingController();
    lastTime = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    serviceName.dispose();
    serviceLocation.dispose();
    timeToComplete.dispose();
    bookPrice.dispose();
    fullPrice.dispose();
    firstTime.dispose();
    lastTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30),
                  CustomAppBar(),
                  SizedBox(height: 30),
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
                  TitleSection(title: 'ايام الخدمة المتاحة'),
                  SizedBox(height: 20),
                  AvailableDaysSection(),
                  SizedBox(height: 30),
                  TitleSection(title: 'ساعات الخدمة المتاحة'),
                  AvailableHoursSection(
                    firstTime: firstTime,
                    lastTime: lastTime,
                    onSelect: selectTime,
                  ),
                  SizedBox(height: 20),
                  PriceSection(),
                  SizedBox(height: 60),
                  ButtonsSection(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: Align(
        alignment: AlignmentGeometry.topRight,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.arrowRight),
          color: kBlue,
        ),
      ),
    );
  }
}
