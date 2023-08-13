import 'package:get/get.dart';
import 'package:newsapp/app/modules/newsweb/controllers/newsweb_controller.dart';


class NewsWebBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsWebController>(
      () => NewsWebController(),
    );
  }
}
