import 'package:cached_network_image/cached_network_image.dart';
import 'package:conclase_movie_app/database/db_model.dart';
import 'package:conclase_movie_app/database/db_movie_model.dart';
import 'package:conclase_movie_app/screen/movie_details/widgets/rating_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesDetails extends StatelessWidget {
  MoviesDetails(
      {this.movie,
      this.id,
      required this.title1,
      required this.title2,
      required this.imageUrl,
      // this.addList,
      this.ratings,
      Key? key})
      : super(key: key);
  final Movie? movie;
  final int? id;
  final String title1, imageUrl;
  final String title2;
  final double? ratings;
  // final VoidCallback? addList;
  final db = MovieDatabase();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.all(10.r),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        width: 390.w,
                        height: 470.h,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 33.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RatingCardWidget(
                        rating: ratings,
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                await db.insertMovie(Movie(
                                    id: id,
                                    movieOverview: title2,
                                    title: title1,
                                    image: imageUrl,
                                    ratings: ratings,
                                    isChecked: false));
                                const snackBar = SnackBar(
                                  content: Text('Added to My List!'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: const Icon(Icons.add_box_outlined)),
                          IconButton(
                              onPressed: () async {
                                await db.deleteMovie(Movie(
                                    id: id,
                                    title: title1,
                                    movieOverview: title2,
                                    image: imageUrl,
                                    isChecked: false));
                                const snackBar = SnackBar(
                                  content: Text('Removed from My List!'),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: const Icon(Icons.send_outlined)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    title1,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    title2,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey.shade300,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
