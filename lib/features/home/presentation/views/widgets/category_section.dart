import 'package:booking_app/core/utlis/styles.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20categories/fetch_categories_cubit.dart';
import 'package:booking_app/features/home/presentation/views/widgets/custom_category_crard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<FetchCategoriesCubit, FetchCategoriesState>(
      builder: (context, state) {
        if (state is FetchCategoriesFailure) {
          return Center(child: Text(state.errorMessage));
        }
        
        if (state is FetchCategoriesSuccess) {
          return state.categories.isEmpty
              ? Center(child: const Text('no data available'))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text('الفئات :', style: Styles.textStyle26),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      height: size.height * 0.11,
                      child: ListView.builder(
                        itemBuilder: (context, index) => CustomCategoryCard(
                          category: state.categories[index],
                              
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                      ),
                    ),
                  ],
                );
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
