import 'package:conclase_movie_app/screen/movie_details/widgets/rating_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingMoviesWidget extends StatelessWidget {
  const TrendingMoviesWidget(
      {required this.title,
      required this.image,
      required this.ratings,
      // required this.pgRatings,
      Key? key})
      : super(key: key);
  final String title, image;
  final double ratings;
  // final String pgRatings;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.r),
          child: Container(
            width: 154,
            height: 190,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )),
            // child: Image.network(mov.posterPath),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade700,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.r),
                  child: const Text('18+'),
                )),
            SizedBox(width: 15.w),
            RatingCardWidget(rating: ratings),
          ],
        ),
        Text(title),
      ],
    );
  }
}
