import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/bloc_observer.dart';
import 'package:booking_app/features/account/data/repos/account_repo_impl.dart';
import 'package:booking_app/features/account/presentation/manager/account_cubit.dart';
import 'package:booking_app/features/account/presentation/manager/logout/logout_cubit.dart';
import 'package:booking_app/features/appointments/data/repos/booking_repo_impl.dart';
import 'package:booking_app/features/appointments/presentation/manager/cancel%20booking/cancel_booking_cubit.dart';
import 'package:booking_app/features/appointments/presentation/manager/fetch%20my%20bookings/fetch_my_bookings_cubit.dart';
import 'package:booking_app/features/appointments/presentation/manager/rating%20cubit/rating_cubit.dart';
import 'package:booking_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:booking_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:booking_app/features/home/presentation/manager/book%20service/book_service_cubit.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20categories/fetch_categories_cubit.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20service%20by%20category%20id/fetch_services_by_category_id_cubit.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20services/fetch_services_cubit.dart';
import 'package:booking_app/features/services/data/repos/customer/customer_repo_impl.dart';
import 'package:booking_app/features/services/data/repos/service%20provider/provider_repo_impl.dart';
import 'package:booking_app/features/services/presentation/manager/customer/be%20provider/be_provider_cubit.dart';
import 'package:booking_app/features/services/presentation/manager/service%20provider/fetch%20service%20into/fetch_service_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final authCubit = AuthCubit(AuthRepoImpl());
void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FetchCategoriesCubit(HomeRepoImpl())..fetchCategories(),
        ),
        BlocProvider(
          create: (context) =>
              FetchServicesCubit(HomeRepoImpl())..fetchServices(),
        ),
        BlocProvider(create: (context) => BeProviderCubit(CustomerRepoImpl())),
        BlocProvider(create: (context) => RatingCubit(BookingRepoImpl())),
        BlocProvider(create: (context) => FetchServicesByCategoryIdCubit()),
        BlocProvider(create: (context) => BookServiceCubit(HomeRepoImpl())),
        BlocProvider(
          create: (context) => FetchMyBookingsCubit(BookingRepoImpl()),
        ),
        BlocProvider(
          create: (context) => CancelBookingCubit(BookingRepoImpl()),
        ),
        BlocProvider(
          create: (context) =>
              FetchBookingRequestCubit(ProviderRepoImpl())
                ..fetchBookingRequests(),
        ),
        BlocProvider(create: (context) => AccountCubit()..fetchUserData()),
        BlocProvider(create: (context) => LogoutCubit(AccountRepoImpl())),
        BlocProvider.value(value: authCubit),
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'NotoSansArabic',
        ),

        debugShowCheckedModeBanner: false,
        title: 'Fourth year project',
        routerConfig: AppRouter.router,
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
      ),
    );
  }
}
