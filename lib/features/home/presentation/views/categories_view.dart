import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/core/widgets/service_card_component.dart';
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
          SliverToBoxAdapter(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) =>  ServiceCardComponent(
                service: ServiceModel(
                  bookPrice: '0',
                  name: 'Service Name',
                  fullPrice: '100',
                  description: 'Service description',
                  images: [],
                  city: 'City',
                  location: 'Location',
                  category: 'Category',
                  comments: [], mainImage: '',
                ),
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
