import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/admin%20features/shipping/presentation/view/widgets/filter_chip.dart';
import 'package:booking_app/features/admin%20features/shipping/presentation/view/widgets/shipping_request_card.dart';
import 'package:flutter/material.dart';

class ShippingViewBody extends StatefulWidget {
  const ShippingViewBody({super.key});

  @override
  State<ShippingViewBody> createState() => _ShippingViewBodyState();
}

class _ShippingViewBodyState extends State<ShippingViewBody> {
  String selectedFilter = 'طلبات تعبئة';

  static final List<ShippingRequestData> _requests = [
    ShippingRequestData(
      name: 'أحمد محمد',
      paymentMethod: 'تحويل بنكي - مباشر',
      transactionNumber: '#TRX-88291',
      amount: '\$50.0',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAYva3nC-LZfIf_ZqoC124JwcqfEsxyAK5RAuzShFXEeSmbmu7Y1a4EmDMZfOOtx-OgO0C_VuP0eIBErpjnyoslZ7MjICjyOKHMBf-BveIncSrwVicnM5qviGyQ0l1_LkLOiVkc-3l6quMyAwy2rze5FLy86ZhwjhdpQupjfs9uqq8GbEOHVwBvVg-1lyOteAJ-lQ5GOw4TSOI7Tz4B5gxoxcdrNM28TUrAaLeNHN4eZ4peycyZKyfhbW2bRxvY44zUG-AFBKh6a9o',
    ),
    ShippingRequestData(
      name: 'سارة العلي',
      paymentMethod: 'بطاقة ائتمان',
      transactionNumber: '#TRX-88304',
      amount: '\$120.0',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAw-MCqXXUH7PTCIT6fpWZTvC0DhUADUiE9BrDFbq53-IDT0Hz1vPIblALKz8JjLqm5OFIMSvaHWH5VV5TN1qs7Je1jJEA_jnqwPBlzI-IQql1_e-dEWTxRFM7_m7aRfzZsvu8TGyIA5X5wJ0h7M_ZRW_Vxs12AervCmu4m2QrjewHivvbSS-3L-5ikrNomRHU2ArCdZVybCIWZiM2glHwlQvjoiWpNfoJ7te-NTVwkcYt_p9B9VEQB5liiAEUt9rSdtTBCwX5rcCU',
    ),
    ShippingRequestData(
      name: 'خالد العتيبي',
      paymentMethod: 'تحويل بنكي - مباشر',
      transactionNumber: '#TRX-88412',
      amount: '\$250.0',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDiy27J2wZlzEBJBtNnuLnDbI5m3pxgxvW09faqTxzz2xaFzqV5yhbhnF0rIVDWOUxZOdfQhB00LkkVghJWlXgcx_TNHOBoug_FRT6GqT3sxGRbZk9RdMgPxBinTWADdRUJfIvA8aKHJTUSDyWs5bRPNFcLucs2GIV21z5EoivTv0IOct4xNxEflQUdnBjJDGzGK8EvOSHIX9CLtpB6iMt30r9cfZ0avoxxV6J2V1WxeZEiejEptzG2aN6TOkZz0RTTVBA2gb0qjGo',
    ),
    ShippingRequestData(
      name: 'ليلى السعيد',
      paymentMethod: 'بطاقة ائتمان',
      transactionNumber: '#TRX-88550',
      amount: '\$15.0',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBxEhMqVVR8Nc61FhtEfpIvry9C_ojwUOxAbgODOwU3n9KlViVGv1dpz7iQ3B6BiNuj3Dh7XXUuMZCnf6gnIQT0ThZVsozr4iH3Cdn2qOPkc5QDj20TGbxVeAzj3wli_8khv1QaCLeJN2II6d7d6iKgeiPjHm249rffASPPyc7b1HnAo413wIfxkWuOTLwYYJcpPFBIktueisnL3bHsnaAxKOBY-lSDLCORqb70wQLeQpPHZQU7UTvMWNUGCUNypDETOGDnHg0t38E',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
            color: const Color(0xFFF8F9FB),

      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 96),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
      
            Text(
              'طلبات النقاط',
              style: Styles.textStyle24.copyWith(
                color: const Color(0xFF191C1E),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ShippingFilterChip(
                    label: 'تعبئة',
                    isSelected: selectedFilter == 'طلبات تعبئة',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'طلبات تعبئة';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ShippingFilterChip(
                    label: 'سحب',
                    isSelected: selectedFilter == 'الطلبات المرفوضة',
                    onTap: () {
                      setState(() {
                        selectedFilter = 'الطلبات المرفوضة';
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ..._requests.map((request) => ShippingRequestCard(request: request)),
          ],
        ),
      ),
    );
  }
}
