import 'package:conclase_movie_app/screen/movie_details/widgets/rating_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TrendingMoviesCardWidget extends StatelessWidget {
  const TrendingMoviesCardWidget(
      {required this.title,
      required this.image,
      this.ratings,
      // required this.pgRatings,
      Key? key})
      : super(key: key);
  final String title, image;
  final double? ratings;
  // final String pgRatings;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.r),
          child: CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context,imageProvider)=> Container(
              width: 154,
              height: 190,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image:imageProvider,
                    fit: BoxFit.cover,
                  )),
              // child: Image.network(mov.posterPath),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade800,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: const Text('18+'),
                )),
            SizedBox(width: 15.w),
            RatingCardWidget(rating: ratings),
          ],
        ),
        SizedBox(height: 5.h),
        Text(title),
      ],
    );
  }
}
