import 'package:conclase_movie_app/screen/home_page/home_page.dart';
import 'package:conclase_movie_app/screen/movie_page/binding/movie_page_binding.dart';
import 'package:conclase_movie_app/screen/movie_page/movie_screen.dart';
import 'package:conclase_movie_app/screen/my_list_page/binding/my_list_binding.dart';
import 'package:conclase_movie_app/screen/my_list_page/my_list_page.dart';
import 'package:get/get.dart';
import '../screen/home_page/binding/home_binding.dart';

class AppRoutes {
  static const String homeScreen = '/home_screen';
  static const String movieScreen = '/movie_screen';
  static const String myListScreen = '/myList_screen';
  //static const String movieDetailScreen = '/movieDetail_screen';

  static List<GetPage> pages = [
    GetPage(
      name: homeScreen,
      page: () => const HomePage(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: movieScreen,
      page: () => const MovieScreen(),
      bindings: [
        MoviePageBinding(),
      ],
    ),
    GetPage(
      name: myListScreen,
      page: () => const MyListPage(),
      bindings: [
        MyListBinding(),
      ],
    )
  ];
}
