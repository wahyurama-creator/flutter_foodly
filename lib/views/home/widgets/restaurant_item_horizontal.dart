import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/app_style.dart';
import 'package:flutter_multi_vendor/commons/reusable_text_widget.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantItemHorizontal extends StatelessWidget {
  final String image;
  final String logo;
  final String title;
  final String time;
  final double rating;
  final void Function()? onTap;

  const RestaurantItemHorizontal({
    super.key,
    required this.image,
    required this.logo,
    required this.title,
    required this.time,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * .75,
        height: 192.h,
        decoration: BoxDecoration(
          color: kLightWhite,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: SizedBox(
                      height: 112.h,
                      width: width * 0.8,
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10.w,
                    top: 10.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50.r),
                      child: Container(
                        color: kLightWhite,
                        padding: EdgeInsets.all(2.w),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Image.network(
                            logo,
                            height: 20.h,
                            width: 20.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableTextWidget(
                    text: title,
                    style: appStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReusableTextWidget(
                        text: 'Delivery Time',
                        style: appStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      ReusableTextWidget(
                        text: time,
                        style: appStyle(
                          fontSize: 9,
                          color: kDark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: kPrimary,
                        ),
                        itemCount: 5,
                        itemSize: 14.h,
                      ),
                      SizedBox(width: 4.w),
                      ReusableTextWidget(
                        text: '($rating) reviews',
                        style: appStyle(
                          fontSize: 9,
                          color: kGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
