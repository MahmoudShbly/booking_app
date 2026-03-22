import 'package:booking_app/core/widgets/service_card_component.dart';
import 'package:booking_app/core/widgets/service_card_shimer.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20service%20by%20category%20id/fetch_services_by_category_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchServicesByCategoryIdCubit,FetchServicesByCategoryIdState>
    (
      builder: (context, state) {
        if (state is FetchServicesByCategoryIdSuccess) {
          return state.services.isEmpty
              ? SliverToBoxAdapter(
                  child: const Center(child: Text('no data available')),
                )
              : SliverToBoxAdapter(
                  child: ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemBuilder: (context, index) =>
                        ServiceCardComponent(service: state.services[index]),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.services.length,
                    shrinkWrap: true,
                  ),
                );
        } else if (state is FetchServicesByCategoryIdFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorMessage)),
          );
        } else {
          return SliverToBoxAdapter(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemBuilder: (context, index) => ServiceCardShimmer(),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 7,
              shrinkWrap: true,
            ),
          );
        }
      },
    );
  }
}
