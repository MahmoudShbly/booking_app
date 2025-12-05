import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/buttons_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/custom_app_bar.dart';
import 'package:booking_app/features/services/presentation/views/widgets/custom_form_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutYourServiceView extends StatefulWidget {
  const AboutYourServiceView({super.key});

  @override
  State<AboutYourServiceView> createState() => _AboutYourServiceViewState();
}

class _AboutYourServiceViewState extends State<AboutYourServiceView> {
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
                  const SizedBox(height: 30),
                  CustomAppBar(),
                  const SizedBox(height: 30),
                  CustomFormData(),
                  const SizedBox(height: 30),
                  ButtonsSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
