import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/features/admin%20features/shipping/presentation/manager/fetch%20topups/fetch_topups_cubit.dart';
import 'package:booking_app/features/admin%20features/shipping/presentation/view/widgets/filter_chip.dart';
import 'package:booking_app/features/admin%20features/shipping/presentation/view/widgets/shipping_request_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShippingViewBody extends StatefulWidget {
  const ShippingViewBody({super.key});

  @override
  State<ShippingViewBody> createState() => _ShippingViewBodyState();
}

class _ShippingViewBodyState extends State<ShippingViewBody> {
  String selectedFilter = 'طلبات تعبئة';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      body: SingleChildScrollView(
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
            BlocBuilder<FetchTopupsCubit, FetchTopupsState>(
              builder: (context, state) {
                if (state is FetchTopupsLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
      
                if (state is FetchTopupsFailure) {
                  return Center(child: Text(state.errorMessage));
                }
                
      
                if (state is FetchTopupsSuccess) {
                  if (state.requests.isEmpty) {
                    return const Center(child: Text('لا توجد طلبات'));
                  }
                  return Column(
                    children: state.requests.map((request) {
                      return ShippingRequestCard(
                        request: ShippingRequestData(
                          id: request.id,
                          name: request.userName,
                          paymentMethod: request.paymentMethod,
                          transactionNumber: request.transactionNumber,
                          amount: request.amount,
                          imageUrl: request.imageUrl,
                        ),
                      );
                    }).toList(),
                  );
                }
      
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
