import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_vendor/commons/background_container.dart';
import 'package:flutter_multi_vendor/commons/normal_appbar.dart';
import 'package:flutter_multi_vendor/commons/shimmers/foodlist_shimmer.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/hooks/fetch_all_restaurants.dart';
import 'package:flutter_multi_vendor/models/restaurants/restaurants_model.dart';
import 'package:flutter_multi_vendor/views/home/widgets/restaurant_item_vertical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllNearbyRestaurantPage extends HookWidget {
  const AllNearbyRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllNearbyRestaurants(restaurantCode: 41007428);
    final List<RestaurantModel>? restaurants = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: const NormalAppBar(
        title: 'Nearby Restaurants',
        backgroundColor: kSecondary,
        textColor: kLightWhite,
      ),
      body: SafeArea(
        child: BackgroundContainer(
          child: isLoading
              ? const FoodsListShimmer()
              : ListView(
                  padding: EdgeInsets.all(12.h),
                  children: List.generate(
                    restaurants!.length,
                    (index) {
                      var restaurant = restaurants[index];
                      return RestaurantItemVertical(
                        restaurant: restaurant,
                      );
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
