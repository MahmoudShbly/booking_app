import 'dart:async';
import 'package:booking_app/core/utils/secure_storage_services.dart';
import 'package:booking_app/features/appointments/data/models/review_model.dart';    
import 'package:booking_app/features/auth/presentation/views/login_view.dart';
import 'package:booking_app/features/auth/presentation/views/register_view.dart';
import 'package:booking_app/features/home/data/models/categories_model.dart';
import 'package:booking_app/features/home/data/models/service_model.dart';
import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20service%20reviews/fetch_service_reviews_cubit.dart';
import 'package:booking_app/features/home/presentation/views/details_view.dart';
import 'package:booking_app/features/home/presentation/views/categories_view.dart';
import 'package:booking_app/features/main/presentation/views/main_view.dart';
import 'package:booking_app/features/services/presentation/views/customer/about_you_service.dart';
import 'package:booking_app/features/services/presentation/views/customer/choose_category_view.dart';
import 'package:booking_app/features/services/presentation/views/customer/terms_and_conditions_view.dart';
import 'package:booking_app/features/services/presentation/views/customer/upload_images_view.dart';
import 'package:booking_app/features/services/presentation/views/service%20provider/review_details_view.dart';
import 'package:booking_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  static final kReviewDetailsView = '/kReviewDetailsView';
  static final storage = SecureStorageServices();

  static final router = GoRouter(
    refreshListenable: GoRouterRefreshStream(authCubit.stream),

    redirect: (context, state) async {
      final token = await SecureStorageServices().getUserToken();
      final isLoginRoute = state.uri.toString() == '/';
      final isRegisterRoute = state.uri.toString() == kRegisterView;

      if (token != null && isLoginRoute) {
        return kMainView;
      } else if (token == null && !isLoginRoute && !isRegisterRoute) {
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
        builder: (context, state) {
          final service = state.extra as ServiceModel;
          return BlocProvider(
            create: (context) =>
                FetchServiceReviewsCubit(HomeRepoImpl())
                  ..fetchServiceReviews(service.id),
            child: DetailsView(service: service),
          );
        },
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
      GoRoute(
        path: kReviewDetailsView,
        builder: (context, state) => ReviewDetailsView(reviews: state.extra as ReviewModel,),
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