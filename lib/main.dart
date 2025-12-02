import 'package:booking_app/core/utils/app_router.dart';
import 'package:booking_app/core/utils/bloc_observer.dart';
import 'package:booking_app/features/home/data/repos/home_repo_impl.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20categories/fetch_categories_cubit.dart';
import 'package:booking_app/features/home/presentation/manager/fetch%20services/fetch_services_cubit.dart';
import 'package:booking_app/features/services/presentation/manager/cubit/be_provider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create:(context)=>FetchCategoriesCubit(HomeRepoImpl())..fetchCategories()),
      BlocProvider(create:(context)=>FetchServicesCubit(HomeRepoImpl())..fetchServices()),
      BlocProvider(create:(context)=>BeProviderCubit()),
    ],
      child: MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'NotoSansArabic',
        ),
      
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
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
