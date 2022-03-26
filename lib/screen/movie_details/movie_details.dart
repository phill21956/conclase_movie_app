
import 'package:conclase_movie_app/screen/movie_details/widgets/rating_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails(
      {this.title1,
      this.title2,
      this.imageUrl,
      this.addList,
      required this.ratings,
      Key? key})
      : super(key: key);
  final String? title1, title2, imageUrl;
  final double ratings;
  final VoidCallback? addList;
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
                    child: Container(
                      width: 390.w,
                      height: 470.h,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl!),
                            fit: BoxFit.cover,
                          )),
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
                              onPressed:addList,
                              icon: const Icon(Icons.add_box_outlined)),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.send_outlined)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Text(
                    title1!,
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    title2!,
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