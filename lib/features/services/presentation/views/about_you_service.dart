import 'package:booking_app/features/services/presentation/views/widgets/custom_app_bar.dart';
import 'package:booking_app/features/services/presentation/views/widgets/form_data_section.dart';
import 'package:flutter/material.dart';

class AboutYourServiceView extends StatefulWidget {
  const AboutYourServiceView({super.key});

  @override
  State<AboutYourServiceView> createState() => _AboutYourServiceViewState();
}

class _AboutYourServiceViewState extends State<AboutYourServiceView> {
  @override
  Widget build(BuildContext context) {
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
              FormDataSection(),
    
            ],
          ),
        ),
      ),
    );
  }
}
