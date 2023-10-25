import 'package:acai/src/shared/themes/my_theme.dart';
import 'package:acai/src/util/page_routes.dart';
import 'package:acai/src/util/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Açai',
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
