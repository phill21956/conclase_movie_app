import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesContentWidget extends StatelessWidget {
  const MoviesContentWidget({this.title, this.image, Key? key})
      : super(key: key);
  final String? title, image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.all(10.r),
            child: Container(
              width: 341,
              height: 191,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(image!), fit: BoxFit.contain),
              ),
              // child: Image.network(mov.posterPath),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.r),
          child: Text(
            title!,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
