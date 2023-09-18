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
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => Container(
                width: 154.w,
                height: 190.w,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingCardWidget(rating: ratings),
          ],
        ),
        SizedBox(height: 5.h),
        FittedBox(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
