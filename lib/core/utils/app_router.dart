import 'package:booking_app/features/home/presentation/views/details_view.dart';
import 'package:booking_app/features/home/presentation/views/categories_view.dart';
import 'package:booking_app/features/main/presentation/views/main_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kCategoriesView = '/kCategoriesView';
  static final kDetailsView = '/kDetailsView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MainView()),
      GoRoute(
        path: kCategoriesView,
        builder: (context, state) => const CategoriesView(),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) => const DetailsView(),
      ),
    ],
  );
}
