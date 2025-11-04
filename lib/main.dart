import 'package:booking_app/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
       fontFamily: 'NotoSansArabic'
      ),
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home: Directionality(textDirection: TextDirection.rtl,child: const MainView()),
    );
  }
}

