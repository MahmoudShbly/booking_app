import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/core/utlis/temp.dart';
import 'package:flutter/material.dart';
import 'package:booking_app/core/utlis/constant.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

class ServiceCardComponent extends StatelessWidget {
  const ServiceCardComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:  0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(Temp.tempImage,fit: BoxFit.cover,),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'سفريات سحلول',
                  style: Styles.textStyle20
                ),
                const SizedBox(height: 6),
                const Text(
                  'للسفر الداخلي و الخارجي في جميع الاوقات وباسعار مدروسة',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 8),
                Row(
                  children: const <Widget>[
                    Icon(FontAwesomeIcons.locationDot,
                        color: Color(0xffCD1111), size: 16),
                    SizedBox(width: 6),
                    Text(
                      'حمص - الكراج الشمالي',
                      style: TextStyle(color: Colors.black87),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
