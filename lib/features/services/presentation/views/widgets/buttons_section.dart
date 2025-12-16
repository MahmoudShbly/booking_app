import 'package:booking_app/core/utils/app_router.dart';
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
  const ButtonsSection({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BeProviderCubit, BeProviderState>(
      builder: (context, state) {
        BeProviderCubit cubit = context.read<BeProviderCubit>();
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
                  if (cubit.formKey.currentState!.validate()) {
                    // print('validator work correctly');
                    // FormModel test = FormModel(
                    //   category: cubit.category,
                    //   name: cubit.serviceName.text,
                    //   description: cubit.serviceDescription.text,
                    //   city: cubit.city,
                    //   location:cubit.serviceLocation.text,
                    //   time: ServiceTimeModel(
                    //     hour: cubit.hour.toString() ,
                    //     minute: cubit.minute.toString(),
                    //   ),
                    //   days: ServiceDaysModel(
                    //     fromDay: cubit.fromDay,
                    //     toDay: cubit.toDay,
                    //   ),
                    //   hours: ServiceHoursModel(
                    //     fromHour:cubit.firstTime.text,
                    //     toHour:cubit.lastTime.text,
                    //   ),
                    //   bookPrice:cubit.bookPrice.text,
                    //   fullPrice: cubit.fullPrice.text,
                    // );
                    // print(
                    //   'category :${test.category}\n name :${test.name} \n des :${test.description} \n city :${test.city} \n location :${test.location} \n time :  ${test.time.hour}:${test.time.minute} \n days : from ${test.days.fromDay} to ${test.days.toDay} \n hours: from ${test.hours.fromHour} to ${test.hours.toHour} \n book price :${test.bookPrice}  full price :${test.fullPrice}',
                    // );
                  GoRouter.of(context).push(AppRouter.kUploadImagesView);
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
