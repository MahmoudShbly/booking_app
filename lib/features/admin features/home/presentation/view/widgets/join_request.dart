import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/admin_service_card_component%20.dart';
import 'package:booking_app/features/admin%20features/providers/presentation/manager/fetch%20not%20accepted%20services/fetch_not_accepted_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JoinRequest extends StatelessWidget {
  const JoinRequest({super.key, required this.state});
  final FetchNotAcceptedServicesState state;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'طلبات الانضمام',
              style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'عرض الكل',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w600,
                color: Color(0xff003D9B),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        state is FetchNotAcceptedServicesSuccess
            ? AdminServiceCardComponent(
                service: (context.read<FetchNotAcceptedServicesCubit>().firstService)!,
              )
            : state is FetchNotAcceptedServicesLoading
                ? const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: CircularProgressIndicator(),
                    ),
                  )
                : const Text('لا توجد طلبات حالياً', textAlign: TextAlign.center),
      ],
    );
  }
}
