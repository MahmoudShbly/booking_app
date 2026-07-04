import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/admin_service_card_component%20.dart';
import 'package:booking_app/features/admin%20features/providers/presentation/manager/fetch%20not%20accepted%20services/fetch_not_accepted_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvidersViewBody extends StatelessWidget {
  const ProvidersViewBody({super.key});

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
                BlocBuilder<
                  FetchNotAcceptedServicesCubit,
                  FetchNotAcceptedServicesState
                >(
                  builder: (context, state) {
                    if (state is FetchNotAcceptedServicesLoading) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state is FetchNotAcceptedServicesFailure) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          state.errorMessage,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (state is FetchNotAcceptedServicesSuccess) {
                      if (state.services.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 24),
                          child: Text(
                            'لا توجد طلبات حالياً',
                            textAlign: TextAlign.center,
                          ),
                        );
                      }

                      return Column(
                        children: state.services
                            .map(
                              (request) =>
                                  AdminServiceCardComponent(service: request),
                            )
                            .toList(),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

