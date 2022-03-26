import 'package:conclase_movie_app/model/trending_movie_model.dart';
import 'package:flutter/material.dart';

import '../../../const/key.dart';
import '../../../services/http_call.dart';
import '../../movie_details/movie_details.dart';
import 'trending_movies.dart';

class TrendingMovieWidget extends StatefulWidget {
  const TrendingMovieWidget({
    Key? key,
    // required this.moviesCatalog,
  }) : super(key: key);

  // final List<Result>? moviesCatalog;

  @override
  State<TrendingMovieWidget> createState() => _TrendingMovieWidgetState();
}

class _TrendingMovieWidgetState extends State<TrendingMovieWidget>
    with MovieApi {
  late Future<TrendingMovieModel> _movieList;
  @override
  void initState() {
    // _upcomingMoviesList = getUpcomingMovies();
    _movieList = trendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _movieList,
        builder: (context, AsyncSnapshot<TrendingMovieModel> snapshot) {
          if (snapshot.hasData) {
            List<TrendingResult>? trendingMoviesCatalog =
                snapshot.data!.results.map((movies) => movies).toList();
            return Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: trendingMoviesCatalog
                    .map((mov) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => MoviesDetails(
                                          title1: mov.title,
                                          title2: mov.overview,
                                          imageUrl:
                                              baseImageURL + mov.posterPath,
                                          ratings: mov.voteAverage,
                                        )),
                              ),
                              child: TrendingMoviesWidget(
                                title: mov.title,
                                image: baseImageURL + mov.posterPath,
                                ratings: mov.voteAverage,
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
