import 'package:booking_app/features/services/data/models/form_model.dart';
import 'package:booking_app/features/services/data/models/service_days_model.dart';
import 'package:booking_app/features/services/data/models/service_hours_model.dart';
import 'package:booking_app/features/services/data/models/service_time_model.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/buttons_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/custom_app_bar.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_main_image.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_multi_image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UploadImagesView extends StatelessWidget {
  const UploadImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BeProviderCubit, BeProviderState>(
        builder: (context, state) {
          final cubit = context.read<BeProviderCubit>();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 32),
                  CustomAppBar(),
                  UploadMainImage(),
                  SizedBox(height: 50),
                  UploadMultiImageSection(),
                  SizedBox(height: 80),

                  ButtonsSection(
                    next: () {
                     final serviceData= FormModel(
                        category: cubit.category,
                        name: cubit.serviceName.text,
                        description: cubit.serviceDescription.text,
                        city: cubit.city,
                        location: cubit.serviceLocation.text,
                        time: ServiceTimeModel(hour: cubit.hour.toString(), minute: cubit.minute.toString()),
                        days: ServiceDaysModel(fromDay: cubit.fromDay, toDay:cubit.toDay),
                        hours: ServiceHoursModel(fromHour: cubit.firstTime.text, toHour: cubit.lastTime.text),
                        bookPrice: cubit.bookPrice.text,
                        fullPrice: cubit.fullPrice.text,
                        mainImage: cubit.mainImage,
                        images: cubit.images,
                      );
                      print(serviceData);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
