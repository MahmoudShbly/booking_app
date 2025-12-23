import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/buttons_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/custom_app_bar.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_main_image.dart';
import 'package:booking_app/features/services/presentation/views/widgets/upload_multi_image_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UploadImagesView extends StatelessWidget {
  const UploadImagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BeProviderCubit, BeProviderState>(
        builder: (context, state) {
          // final cubit = context.read<BeProviderCubit>();
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
                     GoRouter.of(context).push(AppRouter.kTermsAndConditionsView);
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
