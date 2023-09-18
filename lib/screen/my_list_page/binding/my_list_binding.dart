import 'package:conclase_movie_app/screen/my_list_page/controller/my_list_controller.dart';
import 'package:get/get.dart';

class MyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyListController());
  }
}
