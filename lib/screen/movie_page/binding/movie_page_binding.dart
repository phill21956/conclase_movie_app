import 'package:conclase_movie_app/screen/movie_page/controller/movie_page_controller.dart';
import 'package:get/get.dart';

class MoviePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MoviePageController());
  }
}
