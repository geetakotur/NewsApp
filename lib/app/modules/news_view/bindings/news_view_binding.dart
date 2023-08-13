import 'package:get/get.dart';
import 'package:newsapp/app/modules/news_view/controllers/news_view_controller.dart';



class NewsViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsViewController>(
      () => NewsViewController(),
    );
  }
}
