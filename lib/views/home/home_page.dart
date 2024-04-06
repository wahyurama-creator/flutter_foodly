import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/custom_appbar.dart';
import 'package:flutter_multi_vendor/commons/custom_container.dart';
import 'package:flutter_multi_vendor/commons/heading.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/views/home/pages/all_nearby_restaurant_page.dart';
import 'package:flutter_multi_vendor/views/home/pages/all_fastest_food_page.dart';
import 'package:flutter_multi_vendor/views/home/pages/all_recommendation_page.dart';
import 'package:flutter_multi_vendor/views/home/widgets/category_list.dart';
import 'package:flutter_multi_vendor/views/home/widgets/food_list.dart';
import 'package:flutter_multi_vendor/views/home/widgets/nearby_restaurant_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),
              Heading(
                title: 'Nearby Restaurants',
                onTap: () {
                  Get.to(
                    () => const AllNearbyRestaurantPage(),
                    transition: Transition.rightToLeftWithFade,
                  );
                },
              ),
              const NearbyRestaurantList(),
              Heading(
                title: 'Try Something New',
                onTap: () {
                  Get.to(
                    () => const AllRecommendationPage(),
                    transition: Transition.rightToLeftWithFade,
                  );
                },
              ),
              const FoodList(),
              Heading(
                title: 'Food Closer to You',
                onTap: () {
                  Get.to(
                    () => const AllFastestFoodPage(),
                    transition: Transition.rightToLeftWithFade,
                  );
                },
              ),
              const FoodList(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
