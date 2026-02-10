import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/utils/temp.dart';
import 'package:booking_app/core/widgets/custom_location_component.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/core/utils/constant.dart';
import 'package:go_router/go_router.dart';

class ServiceCardComponent extends StatelessWidget {
  const ServiceCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(AppRouter.kDetailsView),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kLightBlue,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(Temp.tempImage, fit: BoxFit.cover),
            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('سفريات سحلول', style: Styles.textStyle20),
                  const SizedBox(height: 6),
                  const Text(
                    'للسفر الداخلي و الخارجي في جميع الاوقات وباسعار مدروسة',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  CustomLocationComponent(location: 'حمص - الكراج الشمالي')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


