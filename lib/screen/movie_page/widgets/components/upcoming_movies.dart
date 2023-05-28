import 'package:flutter/material.dart';

import '../../../../const/key.dart';
import '../../../../model/upcoming_movie_model.dart';
import '../../../../services/http_call.dart';
import '../../../movie_details/movie_details.dart';
import '../movies_content.dart';

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
            List<Results>? moviesCatalog = snapshot.data!.results;
            return Expanded(
              child: ListView.builder(
                itemCount: moviesCatalog.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => MoviesDetails(
                                  id: moviesCatalog[index].id,
                                  title1: moviesCatalog[index].title,
                                  title2: moviesCatalog[index].overview,
                                  imageUrl: baseImageURL +
                                      moviesCatalog[index].backdropPath!,
                                  ratings: moviesCatalog[index].voteAverage,
                                )),
                      ),
                      child: MoviesContentWidget(
                        title: moviesCatalog[index].title,
                        image:
                            baseImageURL + moviesCatalog[index].backdropPath!,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
