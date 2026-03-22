import 'package:booking_app/core/utils/styles.dart';
import 'package:booking_app/core/widgets/custom_app_bar_component.dart';
import 'package:booking_app/features/home/data/models/categories_model.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20service%20by%20category%20id/fetch_services_by_category_id_cubit.dart';
import 'package:booking_app/features/home/presentation/views/widgets/category_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key, required this.category});
  final CategoriesModel category;

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final GlobalKey refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      key: refreshKey,
      onRefresh: () async {
        await context
            .read<FetchServicesByCategoryIdCubit>()
            .fetchServicesByCategoryId(widget.category.id);
      },
      child: Scaffold(
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
                  Text(widget.category.name, style: Styles.textStyle40),
                ],
              ),
            ),
            CategoryViewBody()
          ],
        ),
      ),
    );
  }
}
