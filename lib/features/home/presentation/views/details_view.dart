import 'package:booking_app/core/utils/app_dialog.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_button_component.dart';
import 'package:booking_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';

import 'dart:ui';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(child: SingleChildScrollView(child: DetailsViewBody())),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white.withOpacity(0.6),
                  child: SizedBox(
                    child: CustomButtonComponent(
                      borderRadius: 16,
                      title: 'احجز الان',
                      titleStyle: Styles.textStyle26.copyWith(
                        color: Colors.white,
                      ),
                      height: 55,
                      width: double.infinity,
                      onTap: () {
                        showAppDialog(
                          context: context,
                          title: Text(
                            'تم تقديم الطلب ',
                            style: Styles.textStyle26,
                          ),
                          message:
                              'تم تقديم طلب الحجز بنجاح! سيصلك اشعار لتأكيد الحجز عند موافقة عليه',
                          onConfirm: () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
