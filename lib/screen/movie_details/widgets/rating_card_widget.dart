import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingCardWidget extends StatelessWidget {
  const RatingCardWidget({this.rating, Key? key}) : super(key: key);
  final double? rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade800,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.r),
              child: Text('18+', style: TextStyle(fontSize: 16.sp)),
            )),
        SizedBox(width: 15.w),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade800,
          ),
          child: Padding(
            padding: EdgeInsets.all(5.r),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              const Icon(Icons.star_rate_rounded, color: Color(0xffF3AC4A)),
              Text(rating.toString(), style: TextStyle(fontSize: 16.sp)),
            ]),
          ),
        ),
      ],
    );
  }
}
