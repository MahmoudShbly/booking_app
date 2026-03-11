import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/core/widgets/service_card_component.dart';
import 'package:booking_app/features/home/data/models/categories_model.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20service%20by%20category%20id/cubit/fetch_services_by_category_id_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key,required this.category});
  final CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBarComponent(
            myWidget: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () => context.pop(),
                  icon: const Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                  ),
                ),
                Text(category.name, style: Styles.textStyle40),
              ],
            ),
          ),
          BlocBuilder<FetchServicesByCategoryIdCubit, FetchServicesByCategoryIdState>(
            builder: (context, state) {
              context.read<FetchServicesByCategoryIdCubit>().fetchServicesByCategoryId(category.id);
              if(state is FetchServicesByCategoryIdSuccess)
              {return
                state.services.isEmpty ? SliverToBoxAdapter(child: const Center(child: Text('no data available'))) :
                 SliverToBoxAdapter(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),
                  itemBuilder: (context, index) => ServiceCardComponent(service: state.services[index],),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.services.length,
                  shrinkWrap: true,
                ),
              );} else if(state is FetchServicesByCategoryIdFailure){
                return SliverToBoxAdapter(child: Center(child: Text(state.errorMessage)));
              }
              else {
                return SliverToBoxAdapter(child: const Center(
                  child: CircularProgressIndicator(),
                ));
              }
            },
          ),
        ],
      ),
    );
  }
}
