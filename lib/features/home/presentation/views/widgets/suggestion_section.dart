import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/service_card_component.dart';
import 'package:booking_app/core/widgets/service_card_shimer.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20services/fetch_services_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionSection extends StatelessWidget {
  const SuggestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('اقتراحات قد تعجبك :', style: Styles.textStyle26),

          BlocBuilder<FetchServicesCubit, FetchServicesState>(
            builder: (context, state) {
              if (state is FetchServicesSuccess) {
                return state.services.isEmpty
                    ? Text('لا توجد خدمات متاحة')
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListView.builder(
                            itemBuilder: (context, index) =>
                                ServiceCardComponent(service: state.services[index],),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.services.length,
                            shrinkWrap: true,
                          ),
                        ],
                      );
              } else if (state is FetchServicesFailure) {
                return Center(child: Text(state.errorMessage));
              }
              return ListView.builder(
                itemBuilder: (context, index) => ServiceCardShimmer(),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                shrinkWrap: true,
              );
            },
          ),
        ],
      ),
    );
  }
}
