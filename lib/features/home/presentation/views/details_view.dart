import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text('عيادة الرضوان',style: Styles.textStyle26,),

      ),
      body: SingleChildScrollView(child: DetailsViewBody()),
    );
  }
}