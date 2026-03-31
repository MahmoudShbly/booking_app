import 'dart:async';
import 'package:booking_app/core/utils/scure_storage_services.dart';
import 'package:booking_app/features/auth/presentation/views/login_view.dart';
import 'package:booking_app/features/auth/presentation/views/register_view.dart';
import 'package:booking_app/features/home/data/models/categories_model.dart';
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/presentation/views/details_view.dart';
import 'package:booking_app/features/home/presentation/views/categories_view.dart';
import 'package:booking_app/features/main/presentation/views/main_view.dart';
import 'package:booking_app/features/services/presentation/views/about_you_service.dart';
import 'package:booking_app/features/services/presentation/views/choose_category_view.dart';
import 'package:booking_app/features/services/presentation/views/terms_and_conditions_view.dart';
import 'package:booking_app/features/services/presentation/views/upload_images_view.dart';
import 'package:booking_app/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kRegisterView = '/kRegisterView';
  static final kMainView = '/kMainView';                         
  static final kCategoriesView = '/kCategoriesView';
  static final kDetailsView = '/kDetailsView';
  static final kChooseCategoryView = '/kChooseCategoryView';
  static final kAboutYourServiceView = '/kAboutYourServiceView';
  static final kUploadImagesView = '/kUploadImagesView';
  static final kTermsAndConditionsView = '/kTermsAndConditionsView';
  static final storage = ScureStorageServices();

  static final router = GoRouter(
    refreshListenable: GoRouterRefreshStream(authCubit.stream),

    redirect: (context, state) async {
      final token = await ScureStorageServices().getUserToken();
      if (token != null && state.uri.toString() == '/') {
        return kMainView;                                       
      } else if (token == null && state.uri.toString() != '/') {
        return '/';
      }
      return null;
    },

    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginView()),

      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),

      GoRoute(
        path: kMainView,                                         
        builder: (context, state) => const MainView(),
      ),

      GoRoute(
        path: kCategoriesView,
        builder: (context, state) =>
            CategoriesView(category: state.extra as CategoriesModel),
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) =>
            DetailsView(service: state.extra as ServiceModel),
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
      GoRoute(
        path: kTermsAndConditionsView,
        builder: (context, state) => const TermsAndConditionsView(),
      ),
    ],
  );
}


class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}