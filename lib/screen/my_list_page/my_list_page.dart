import 'package:conclase_movie_app/database/db_movie_model.dart';
import 'package:conclase_movie_app/screen/movie_page/widgets/trending_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../const/key.dart';
import '../../database/db_model.dart';
import '../movie_details/movie_details.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({Key? key}) : super(key: key);

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  final db = MovieDatabase();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Movie>>(
        future: db.getMovie(),
        builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            List<Movie>? moviesCatalog = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(25.r, 35.r, 0.r, 20.r),
                      child: Text('Likes',
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.w700)),
                    ),
                    GridView.builder(
                      itemCount: moviesCatalog.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              MediaQuery.of(context).size.width / 600.h,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, index) {
                        Movie mov = moviesCatalog[index];
                        return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => MoviesDetails(
                                      id: mov.id,
                                      title1: mov.title,
                                      title2: mov.movieOverview,
                                      imageUrl: baseImageURL + mov.image,
                                      ratings: mov.ratings,
                                    )),
                          ),
                          child: TrendingMoviesCardWidget(
                            title: mov.title,
                            image: baseImageURL + mov.image,
                            ratings: mov.ratings,
                          ),
                        );
                      },
                    ),
                  ]),
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
