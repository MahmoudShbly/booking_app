import 'package:booking_app/core/utlis/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
    );
  }
}
