import 'package:conclase_movie_app/services/http_call.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/trending_movies_widget.dart';
import '../widgets/upcoming_movies.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> with MovieApi {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        SizedBox(
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
              const UpcomingMoviesWidget(),
              Padding(
                padding: EdgeInsets.fromLTRB(25.r, 0.r, 0.r, 0.r),
                child: Text('Trending Now',
                    style: TextStyle(
                        fontSize: 20.sp, fontWeight: FontWeight.w700)),
              ),
              const TrendingMovieWidget(),
            ],
          ),
        )
      ]),
    ));
  }
}
