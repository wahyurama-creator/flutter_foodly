import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/app_style.dart';
import 'package:flutter_multi_vendor/commons/reusable_text_widget.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/models/foods/food_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class FoodItemVertical extends StatelessWidget {
  final FoodModel food;

  const FoodItemVertical({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: width,
            decoration: BoxDecoration(
              color: kOffWhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.r),
                    ),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.network(
                            food.imageUrl.first,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 6.w,
                              right: 6.w,
                              bottom: 2.h,
                            ),
                            color: kGray.withOpacity(0.6),
                            height: 16.h,
                            width: width,
                            child: RatingBarIndicator(
                              rating: food.rating,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: kSecondary,
                              ),
                              itemCount: 5,
                              itemSize: 12.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableTextWidget(
                        text: food.title,
                        style: appStyle(
                          fontSize: 11,
                          color: kDark,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ReusableTextWidget(
                        text: 'Delivery time: ${food.time}',
                        style: appStyle(
                          fontSize: 11,
                          color: kGray,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.7,
                        child: SizedBox(
                          width: width * 0.7,
                          height: 15.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: food.additives.length,
                            itemBuilder: (context, index) {
                              var additive = food.additives[index];
                              return Container(
                                margin: EdgeInsets.only(
                                  right: index == food.additives.length - 1
                                      ? 0
                                      : 3.w,
                                  left: index == 0 ? 0 : 3.w,
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                decoration: BoxDecoration(
                                  color: kSecondaryLight,
                                  borderRadius: BorderRadius.circular(9.r),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(2.h),
                                    child: ReusableTextWidget(
                                      text: additive.title,
                                      style: appStyle(
                                        fontSize: 8,
                                        color: kGray,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 60.w,
              height: 19.h,
              decoration: BoxDecoration(
                color: kPrimary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: ReusableTextWidget(
                  text: '\$ ${food.price.toStringAsFixed(2)}',
                  style: appStyle(
                    fontSize: 12,
                    color: kLightWhite,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 70.w,
            top: 6.h,
            child: Container(
              width: 19.w,
              height: 19.h,
              decoration: BoxDecoration(
                color: kSecondary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Center(
                child: Icon(
                  MaterialCommunityIcons.cart_plus,
                  size: 15.h,
                  color: kLightWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
