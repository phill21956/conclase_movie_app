import 'package:flutter/material.dart';

import '../../../../const/key.dart';
import '../../../../model/search_model.dart';
import '../../movie_details/movie_details.dart';
import '../../movie_page/widgets/trending_movies.dart';

class BuildResults extends StatelessWidget {
  const BuildResults({
    Key? key,
    required this.data,
  }) : super(key: key);

  final List<Result>? data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        physics: const ScrollPhysics(),
        itemCount: data!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => MoviesDetails(
                        id: data![index].id,
                        title1: data![index].title,
                        title2: data![index].overview,
                        imageUrl: baseImageURL + data![index].posterPath,
                        ratings: data![index].voteAverage,
                      )),
            ),
            child: TrendingMoviesCardWidget(
              title: data![index].title,
              image: baseImageURL + data![index].posterPath,
              ratings: data![index].voteAverage,
            ),
          );
        });
  }
}
