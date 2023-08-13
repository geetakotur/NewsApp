import 'package:get/get.dart';
import 'package:newsapp/app/modules/home/bindings/home_binding.dart';
import 'package:newsapp/app/modules/home/views/home_view.dart';
import 'package:newsapp/app/modules/news_view/bindings/news_view_binding.dart';
import 'package:newsapp/app/modules/news_view/views/news_view.dart';
import 'package:newsapp/app/modules/newsweb/views/newsweb_view.dart';



part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_VIEW,
      page: () => NewsView(),
      binding: NewsViewBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_WEB,
      page: () => NewsWebView(),
      binding: NewsViewBinding(),
    ),
  ];
}
