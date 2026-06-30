import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/admin_service_card_component%20.dart';
import 'package:booking_app/features/user%20features/home/data/models/service_model.dart';
import 'package:flutter/material.dart';

class ProvidersList extends StatelessWidget {
  const ProvidersList({super.key});

  static final _items = [
    {
      'id': 1,
      'name': 'احمد ياسين',
      'description': 'خدمات الصيانة والإصلاح',
      'location': 'الجزيرة السابعة',
      'city': 'حمص',
      'images': ['https://via.placeholder.com/100'],
      'mainImage': 'https://via.placeholder.com/100',
      'bookPrice': '50',
      'fullPrice': '100',
      'categoryId': '1',
    },
    {
      'id': 2,
      'name': 'سامر محمود',
      'description': 'خدمات التنظيف والتطهير',
      'location': 'شارع بغداد',
      'city': 'حمص',
      'images': ['https://via.placeholder.com/100'],
      'mainImage': 'https://via.placeholder.com/100',
      'bookPrice': '60',
      'fullPrice': '120',
      'categoryId': '2',
    },
    {
      'id': 3,
      'name': 'ليث علي',
      'description': 'خدمات التدريب والاستشارة',
      'location': 'الكورنيش',
      'city': 'حمص',
      'images': ['https://via.placeholder.com/100'],
      'mainImage': 'https://via.placeholder.com/100',
      'bookPrice': '75',
      'fullPrice': '150',
      'categoryId': '3',
    },
    {
      'id': 4,
      'name': 'هند قاسم',
      'description': 'خدمات التصميم والديكور',
      'location': 'الشارع الرئيسي',
      'city': 'حمص',
      'images': ['https://via.placeholder.com/100'],
      'mainImage': 'https://via.placeholder.com/100',
      'bookPrice': '80',
      'fullPrice': '160',
      'categoryId': '4',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('المزودين الاعلى تقييما : ', style: Styles.textStyle16),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _items.length,
          itemBuilder: (context, index) {
            final item = _items[index];
            final service = ServiceModel(
              id: item['id'] as int,
              name: item['name'] as String,
              description: item['description'] as String,
              location: item['location'] as String,
              city: item['city'] as String,
              images: List<String>.from(item['images'] as List<dynamic>),
              mainImage: item['mainImage'] as String,
              bookPrice: item['bookPrice'] as String,
              fullPrice: item['fullPrice'] as String,
              categoryId: item['categoryId'] as String,
            );
            return AdminServiceCardComponent(service: service);
          },
        ),
      ],
    );
  }
}
