import 'package:conclase_movie_app/screen/movie_details/widgets/rating_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingMoviesWidget extends StatelessWidget {
  const TrendingMoviesWidget(
      {required this.title,
      required this.image,
      required this.ratings,
      Key? key})
      : super(key: key);
  final String title, image;
  final double ratings;
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
        RatingCardWidget(rating: ratings),
        Text(title),
      ],
    );
  }
}
