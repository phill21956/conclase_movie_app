import 'package:conclase_movie_app/services/http_call.dart';
import 'package:get/get.dart';

import '../../../model/upcoming_movie_model.dart';

class MoviePageController extends GetxController {
  final MovieApi movieApi = Get.put(MovieApi());

  Rx<UpcomingMoviesModel?> upcomingMovies = Rx<UpcomingMoviesModel?>(null);
  RxBool isDataLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUpcomingMovies();
  }

  Future<UpcomingMoviesModel?> fetchUpcomingMovies() async {
    try {
      isDataLoading(true);
      upcomingMovies.value = await movieApi.getUpcomingMovies();
      return upcomingMovies.value;
    } catch (error) {
      // Handle error
      throw error.toString();
    } finally {
      isDataLoading(false);
    }
  }
}
