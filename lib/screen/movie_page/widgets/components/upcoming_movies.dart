import 'package:conclase_movie_app/screen/movie_page/controller/movie_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../const/key.dart';
import '../../../../model/upcoming_movie_model.dart';
import '../../../movie_details/movie_details.dart';
import '../movies_content.dart';

class UpcomingMoviesWidget extends StatefulWidget {
  const UpcomingMoviesWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<UpcomingMoviesWidget> createState() => _UpcomingMoviesWidgetState();
}

class _UpcomingMoviesWidgetState extends State<UpcomingMoviesWidget> {
  final MoviePageController movieController = Get.put(MoviePageController());

  @override
  void initState() {
    super.initState();
    movieController.fetchUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (movieController.upcomingMovies.value == null) {
        if (movieController.isDataLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Text('Error fetching upcoming movies');
        }
      } else {
        List<Results>? moviesCatalog =
            movieController.upcomingMovies.value!.results;
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Results mov = moviesCatalog[index];
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Get.to(MoviesDetails(
                      id: mov.id,
                      title1: mov.title,
                      title2: mov.overview,
                      imageUrl: baseImageURL + mov.backdropPath!,
                      ratings: mov.voteAverage,
                    )),
                    child: MoviesContentWidget(
                      title: mov.title,
                      image: baseImageURL + mov.backdropPath!,
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }
    });
  }
}
 

// class _UpcomingMoviesWidgetState extends State<UpcomingMoviesWidget> {
//   Future<UpcomingMoviesModel>? _upcomingMoviesList;
//   // final MoviePageController movieController = Get.put(MoviePageController());
//   final MovieApi movieApi = Get.put(MovieApi());
//   @override
//   void initState() {
//     super.initState();
//     _upcomingMoviesList = movieApi.getUpcomingMovies();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: _upcomingMoviesList,
//         builder: (context, AsyncSnapshot<UpcomingMoviesModel> snapshot) {
//           if (snapshot.hasData) {
//             List<Results>? moviesCatalog = snapshot.data!.results;
//             return Expanded(
//                 child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) {
//                 Results mov = moviesCatalog[index];
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () => Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (context) => MoviesDetails(
//                                   id: mov.id,
//                                   title1: mov.title,
//                                   title2: mov.overview,
//                                   imageUrl: baseImageURL + mov.backdropPath!,
//                                   ratings: mov.voteAverage,
//                                 )),
//                       ),
//                       child: MoviesContentWidget(
//                         title: mov.title,
//                         image: baseImageURL + mov.backdropPath!,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ));
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//           return const Center(child: CircularProgressIndicator());
//         });
//   }
// }


