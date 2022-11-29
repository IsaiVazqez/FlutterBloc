import 'package:get/get.dart';
import 'package:loginbloc/api/repositories.dart';
import 'package:loginbloc/common/controllers/post_controller.dart';

class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataController>(() => DataController());
    Get.lazyPut<PostController>(() => PostController());
  }
}
