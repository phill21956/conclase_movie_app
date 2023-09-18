import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/movie_text_widget.dart';
import 'widgets/components/trending_movies_widget.dart';
import 'widgets/components/upcoming_movies.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 600.h,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 35, 0, 5),
                      child: MovieTextWidget(title: 'Coming Soon'),
                    ),
                    UpcomingMoviesWidget(),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 0, 5),
                      child: MovieTextWidget(title: 'Trending Now'),
                    ),
                    TrendingMovieWidget(),
                  ],
                ),
              ),
              // Expanded(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisSize: MainAxisSize.min,
              //     children: const [
              //       Padding(
              //         padding: EdgeInsets.fromLTRB(25, 10, 0, 5),
              //         child: MovieTextWidget(title: 'Trending Now'),
              //       ),
              //       TrendingMovieWidget(),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
