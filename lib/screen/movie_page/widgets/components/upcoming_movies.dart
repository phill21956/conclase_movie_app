import 'package:conclase_movie_app/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../const/key.dart';
import '../../../../model/upcoming_movie_model.dart';
import '../../../../services/http_call.dart';
import '../../../movie_details/movie_details.dart';
import '../movies_content.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpcomingMoviesWidget extends ConsumerWidget {
  // late Future<UpcomingMoviesModel> _upcomingMoviesList;

  const UpcomingMoviesWidget({Key? key}) : super(key: key);
  // @override
  // void initState() {
  //   _upcomingMoviesList = getUpcomingMovies();
  //   // _movieList = getMovies();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<UpcomingMoviesModel> _upcomingMoviesList =
        ref.watch(movieProvider);
    return _upcomingMoviesList.when(
        error: (err, stack) => Text('Error: $err'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (UpcomingMoviesModel item) {
          return Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: item.results.length,
              itemBuilder: (context, index) {
                Results mov = item.results[index];
               return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => MoviesDetails(
                                  id: mov.id,
                                  title1: mov.title,
                                  title2: mov.overview,
                                  imageUrl: baseImageURL + mov.backdropPath!,
                                  ratings: mov.voteAverage,
                                )),
                      ),
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
        });
    // FutureBuilder(
    //     //future: _upcomingMoviesList,
    //     builder: (context, AsyncSnapshot<UpcomingMoviesModel> snapshot) {
    //   if (snapshot.hasData) {
    //     List<Results>? moviesCatalog =
    //         snapshot.data!.results.map((movies) => movies).toList();
    //     return Expanded(
    //       child: ListView(
    //         scrollDirection: Axis.horizontal,
    //         children: moviesCatalog
    //             .map((mov) => Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     GestureDetector(
    //                       onTap: () => Navigator.of(context).push(
    //                         MaterialPageRoute(
    //                             builder: (context) => MoviesDetails(
    //                                   id: mov.id,
    //                                   title1: mov.title,
    //                                   title2: mov.overview,
    //                                   imageUrl:
    //                                       baseImageURL + mov.backdropPath!,
    //                                   ratings: mov.voteAverage,
    //                                 )),
    //                       ),
    //                       child: MoviesContentWidget(
    //                         title: mov.title,
    //                         image: baseImageURL + mov.backdropPath!,
    //                       ),
    //                     ),
    //                   ],
    //                 ))
    //             .toList(),
    //       ),
    //     );
    //   } else if (snapshot.hasError) {
    //     return Text('${snapshot.error}');
    //   }
    //   return const Center(child: CircularProgressIndicator());
    // });
  }
}
