import 'package:booking_app/features/services/presentation/views/widgets/customer/services_view_body.dart';
import 'package:flutter/material.dart';

class CustomerServicesView extends StatelessWidget {
  const CustomerServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ServicesViewBody() ,
    );
  }
}