import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/core/widgets/service_card_component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart'; 

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CustomAppBarComponent(
            myWidget: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                  ),
                ),
                const Text('الفئات', style: Styles.textStyle40),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0), 
              itemBuilder: (context, index) => const ServiceCardComponent(),
              itemCount: 15,
        
            ),
          ),
        ],
      ),
    );
  }
}