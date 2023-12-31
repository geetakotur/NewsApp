import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsapp/app/core/env/theme.dart';
import 'package:newsapp/app/core/env/theme_service.dart';
import 'package:newsapp/app/data/service/binding.dart';


import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: YourTheme.lightTheme,
      darkTheme: YourTheme.darkTheme,
      themeMode: ThemeService().getThemeMode(),
      initialBinding: GlobalBinding(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
