import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/background_container.dart';
import 'package:flutter_multi_vendor/commons/normal_appbar.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/constants/uidata.dart';
import 'package:flutter_multi_vendor/views/home/widgets/restaurant_item_vertical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllNearbyRestaurantPage extends StatelessWidget {
  const AllNearbyRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: const NormalAppBar(
        title: 'Nearby Restaurants',
        backgroundColor: kSecondary,
        textColor: kLightWhite,
      ),
      body: SafeArea(
        child: BackgroundContainer(
          child: ListView(
            padding: EdgeInsets.all(12.h),
            children: List.generate(
              restaurants.length,
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
