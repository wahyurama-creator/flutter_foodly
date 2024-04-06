import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/constants/uidata.dart';
import 'package:flutter_multi_vendor/views/home/widgets/restaurant_item_horizontal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurantList extends StatelessWidget {
  const NearbyRestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 194.h,
      padding: EdgeInsets.only(top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          restaurants.length,
          (index) {
            var restaurant = restaurants[index];
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 12.w : 4.w,
                right: index == restaurants.length - 1 ? 12.w : 4.w,
              ),
              child: RestaurantItemHorizontal(
                image: restaurant['imageUrl'] as String,
                logo: restaurant['logoUrl'] as String,
                title: restaurant['title'] as String,
                time: restaurant['time'] as String,
                rating: restaurant['rating'] as int,
              ),
            );
          },
        ),
      ),
    );
  }
}
