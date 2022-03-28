import 'package:flutter/material.dart';

import '../../../const/key.dart';
import '../../../model/upcoming_movie_model.dart';
import '../../../services/http_call.dart';
import '../../movie_details/movie_details.dart';
import 'movies_content.dart';

class UpcomingMoviesWidget extends StatefulWidget {
  const UpcomingMoviesWidget({
    Key? key,
  //  required this.moviesCatalog,
  }) : super(key: key);

//  final List<Results>? moviesCatalog;

  @override
  State<UpcomingMoviesWidget> createState() => _UpcomingMoviesWidgetState();
}

class _UpcomingMoviesWidgetState extends State<UpcomingMoviesWidget>
    with MovieApi {
  late Future<UpcomingMoviesModel> _upcomingMoviesList;
  @override
  void initState() {
    _upcomingMoviesList = getUpcomingMovies();
    // _movieList = getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _upcomingMoviesList,
        builder: (context, AsyncSnapshot<UpcomingMoviesModel> snapshot) {
          if (snapshot.hasData) {
            List<Results>? moviesCatalog =
                snapshot.data!.results.map((movies) => movies).toList();
            return Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: moviesCatalog
                    .map((mov) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => MoviesDetails(
                                      id: mov.id,
                                          title1: mov.title,
                                          title2: mov.overview,
                                          imageUrl:
                                              baseImageURL + mov.backdropPath,
                                          ratings: mov.voteAverage,
                                        )),
                              ),
                              child: MoviesContentWidget(
                                title: mov.title,
                                image: baseImageURL + mov.backdropPath,
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
