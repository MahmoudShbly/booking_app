import 'package:booking_app/features/services/presentation/manager/service%20provider/fetch%20provider%20service%20info/fetch_provider_service_info_cubit_cubit.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/app_bar_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/bookings_management_section.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/profits_card.dart';
import 'package:booking_app/features/services/presentation/views/widgets/service%20provider/review_section.dart';
import 'package:booking_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// MVVM - View: Main service provider screen layout.
class ServiceProviderViewBody extends StatelessWidget {
  const ServiceProviderViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child:
              BlocBuilder<
                FetchProviderServiceInfoCubitCubit,
                FetchProviderServiceInfoCubitState
              >(
                builder: (context, state) {
                  if (state is FetchProviderServiceInfoCubitLoading) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (state is FetchProviderServiceInfoCubitFailure) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        state.message,
                        textAlign: TextAlign.center,
                        style: Styles.textStyle12.copyWith(
                          color: Colors.red.shade700,
                        ),
                      ),
                    );
                  }
                  if (state is FetchProviderServiceInfoCubitSuccess) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        AppBarSection(serviceName: state.serviceInfo.name),
                      SizedBox(height: 16),
                      ProfitsCard(),
                      SizedBox(height: 20),
                      BookingsManagementSection(),
                      SizedBox(height: 20),
                      ReviewSection(serviceId: state.serviceInfo.id),
                      SizedBox(height: 26),
                      ],
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
        ),
      ),
    );
  }
}
