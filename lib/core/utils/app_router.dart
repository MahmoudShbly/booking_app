import 'package:booking_app/features/home/presentation/views/details_view.dart';
import 'package:booking_app/features/home/presentation/views/categories_view.dart';
import 'package:booking_app/features/main/presentation/views/main_view.dart';
import 'package:booking_app/features/services/presentation/views/about_you_service.dart';
import 'package:booking_app/features/services/presentation/views/choose_category_view.dart';
import 'package:booking_app/features/services/presentation/views/upload_images_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kCategoriesView = '/kCategoriesView';
  static final kDetailsView = '/kDetailsView';
  static final kChooseCategoryView = '/kChooseCategoryView';
  static final kAboutYourServiceView = '/kAboutYourServiceView';
  static final kUploadImagesView = '/kUploadImagesView';
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
      GoRoute(
        path: kChooseCategoryView,
        builder: (context, state) => const ChooseCategoryView(),
      ),
      GoRoute(
        path: kAboutYourServiceView,
        builder: (context, state) => const AboutYourServiceView(),
      ),
      GoRoute(
        path: kUploadImagesView,
        builder: (context, state) => const UploadImagesView(),
      ),
    ],
  );
}
