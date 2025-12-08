
import 'package:booking_app/core/utils/constant.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/services/data/models/form_model.dart';
import 'package:booking_app/features/services/data/models/service_days_model.dart';
import 'package:booking_app/features/services/data/models/service_hours_model.dart';
import 'package:booking_app/features/services/data/models/service_time_model.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ButtonsSection extends StatelessWidget {
  const ButtonsSection({
    super.key,
    required this.formKey,
    required this.serviceName,
    required this.serviceLocation,
    required this.firstTime,
    required this.lastTime,
    required this.bookPrice,
    required this.fullPrice,
    required this.serviceDescription,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController serviceName;
  final TextEditingController serviceDescription;
  final TextEditingController serviceLocation;
  final TextEditingController firstTime;
  final TextEditingController lastTime;
  final TextEditingController bookPrice;
  final TextEditingController fullPrice;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        var cubit = context.read<BeProviderCubit>();
        return Row(
          children: <Widget>[
            Expanded(
              child: CustomButtonComponent(
                title: 'رجوع',
                titleStyle: Styles.textStyle20.copyWith(color: kBlue),
                color: Colors.white,
                border: Border.all(color: kBlue),
                borderRadius: 10,
                onTap: () => GoRouter.of(context).pop(),
              ),
            ),
            Expanded(
              child: CustomButtonComponent(
                title: 'متابعة',
                titleStyle: Styles.textStyle20.copyWith(color: Colors.white),
                borderRadius: 10,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print('validator work correctly');
                    FormModel test = FormModel(
                      category: cubit.category,
                      name: serviceName.text,
                      description: serviceDescription.text,
                      city: cubit.city,
                      location: serviceLocation.text,
                      time: ServiceTimeModel(
                        hour: cubit.hour.toString() ,
                        minute: cubit.minute.toString(),
                      ),
                      days: ServiceDaysModel(
                        fromDay: cubit.fromDay,
                        toDay: cubit.toDay,
                      ),
                      hours: ServiceHoursModel(
                        fromHour: firstTime.text,
                        toHour: lastTime.text,
                      ),
                      bookPrice: bookPrice.text,
                      fullPrice: fullPrice.text,
                    );
                    print(
                      'category :${test.category}\n name :${test.name} \n des :${test.description} \n city :${test.city} \n location :${test.location} \n time :  ${test.time.hour}:${test.time.minute} \n days : from ${test.days.fromDay} to ${test.days.toDay} \n hours: from ${test.hours.fromHour} to ${test.hours.toHour} \n book price :${test.bookPrice}  full price :${test.fullPrice}',
                    );
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
