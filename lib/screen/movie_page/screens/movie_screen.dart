import 'package:conclase_movie_app/const/key.dart';
import 'package:conclase_movie_app/model/movie_model.dart';
import 'package:conclase_movie_app/screen/movie_details/movie_details.dart';
import 'package:conclase_movie_app/screen/movie_page/widgets/movies_content.dart';
import 'package:conclase_movie_app/screen/movie_page/widgets/trending_movies.dart';
import 'package:conclase_movie_app/services/http_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> with MovieApi {
  late Future<MovieModel> _movieList;

  @override
  void initState() {
    _movieList = getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _movieList,
        builder: (context, AsyncSnapshot<MovieModel> snapshot) {
          if (snapshot.hasData) {
            List<Result>? moviesCatalog =
                snapshot.data!.results.map((movies) => movies).toList();
            return SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.r, 35.r, 0.r, 20.r),
                      child: Text('Coming Soon',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w700)),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: moviesCatalog
                            .map((mov) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MoviesDetails(
                                                  title1: mov.title,
                                                  title2: mov.overview,
                                                  imageUrl: baseImageURL +
                                                      mov.backdropPath,
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
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.r, 0.r, 0.r, 0.r),
                      child: Text('Trending Now',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w700)),
                    ),
                    Expanded(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: moviesCatalog
                            .map((mov) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MoviesDetails(
                                                  title1: mov.title,
                                                  title2: mov.overview,
                                                  imageUrl: baseImageURL +
                                                      mov.posterPath,
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
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}


//  SizedBox(height: 10.h),
//               Text('Coming Soon',
//                   style:
//                       TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700)),