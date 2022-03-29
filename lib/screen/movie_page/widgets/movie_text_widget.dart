import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieTextWidget extends StatelessWidget {
  const MovieTextWidget({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700));
  }
}
