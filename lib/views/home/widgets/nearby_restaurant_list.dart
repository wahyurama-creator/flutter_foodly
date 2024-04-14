
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_vendor/commons/shimmers/nearby_shimmer.dart';
import 'package:flutter_multi_vendor/hooks/fetch_restaurants.dart';
import 'package:flutter_multi_vendor/models/restaurants/restaurants_model.dart';
import 'package:flutter_multi_vendor/views/home/widgets/restaurant_item_horizontal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NearbyRestaurantList extends HookWidget {
  const NearbyRestaurantList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchNearbyRestaurants(restaurantCode: 41007428);
    final List<RestaurantModel>? restaurantsItem = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return Container(
      height: 194.h,
      padding: EdgeInsets.only(top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                restaurantsItem!.length,
                (index) {
                  var restaurant = restaurantsItem[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 12.w : 4.w,
                      right: index == restaurantsItem.length - 1 ? 12.w : 4.w,
                    ),
                    child: RestaurantItemHorizontal(
                      image: restaurant.imageUrl,
                      logo: restaurant.logoUrl,
                      title: restaurant.title,
                      time: restaurant.time,
                      rating: restaurant.rating,
                    ),
                  );
                },
              ),
            ),
    );
  }
}
