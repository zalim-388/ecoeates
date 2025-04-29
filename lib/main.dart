import 'package:ecoeates/SplashscreenPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(393, 852),
        builder: (context, child) => MaterialApp(
            debugShowCheckedModeBanner: false, home: Splashscreenpage()));
  }
}
