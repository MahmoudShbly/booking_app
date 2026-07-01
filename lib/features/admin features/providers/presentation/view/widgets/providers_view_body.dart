import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/admin_service_card_component%20.dart';
import 'package:booking_app/features/user%20features/home/data/models/service_model.dart';
import 'package:flutter/material.dart';

class ProvidersViewBody extends StatefulWidget {
  const ProvidersViewBody({super.key});

  @override
  State<ProvidersViewBody> createState() => _ProvidersViewBodyState();
}

class _ProvidersViewBodyState extends State<ProvidersViewBody> {

  static final List<ServiceModel> _requests = [
    
       ServiceModel(
        id: 1,
        name: 'خدمات النجارة المتكاملة',
        description: 'أحمد محمود الخالدي',
        location: 'المنطقة الصناعية',
        city: 'حمص',
        images: const ['https://via.placeholder.com/100'],
        mainImage: 'https://via.placeholder.com/100',
        bookPrice: '50',
        fullPrice: '100',
        categoryId: '1',
      ),
   
     ServiceModel(
        id: 2,
        name: 'تصميم ديكورات مودرن',
        description: 'سارة عبد الرحمن',
        location: 'شارع الحضارة',
        city: 'حمص',
        images: const ['https://via.placeholder.com/100'],
        mainImage: 'https://via.placeholder.com/100',
        bookPrice: '60',
        fullPrice: '120',
        categoryId: '2',
      ),
     ServiceModel(
        id: 3,
        name: 'فني كهرباء منازل',
        description: 'محمد إبراهيم حسن',
        location: 'حي الوعر',
        city: 'حمص',
        images: const ['https://via.placeholder.com/100'],
        mainImage: 'https://via.placeholder.com/100',
        bookPrice: '75',
        fullPrice: '150',
        categoryId: '3',
      ),
    
    ServiceModel(
        id: 4,
        name: 'شركة مياه وصرف صحي',
        description: 'خالد عمر اليوسف',
        location: 'شارع بغداد',
        city: 'حمص',
        images: const ['https://via.placeholder.com/100'],
        mainImage: 'https://via.placeholder.com/100',
        bookPrice: '80',
        fullPrice: '160',
        categoryId: '4',
      ),
    
  ];

  @override
  Widget build(BuildContext context) {
 
    return ColoredBox(
      color: const Color(0xFFF8F9FB),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 64, 16, 96),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    'طلبات الانضمام',
                    style: Styles.textStyle24.copyWith(
                      color: const Color(0xFF191C1E),
                      fontWeight: FontWeight.w700,
                      height: 28 / 20,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              
                ..._requests.map(
                  (request) =>
                      AdminServiceCardComponent(service: request),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}




