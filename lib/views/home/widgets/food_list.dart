import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/constants/uidata.dart';
import 'package:flutter_multi_vendor/views/home/widgets/food_item_horizontal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 184.h,
      padding: EdgeInsets.only(top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          foods.length,
          (index) {
            var food = foods[index];
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 12.w : 4.w,
                right: index == restaurants.length - 1 ? 12.w : 4.w,
              ),
              child: FoodItemHorizontal(
                image: food['imageUrl'] as String,
                title: food['title'] as String,
                time: food['time'] as String,
                price: food['price'].toStringAsFixed(2),
              ),
            );
          },
        ),
      ),
    );
  }
}
