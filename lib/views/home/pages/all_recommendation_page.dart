import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_vendor/commons/background_container.dart';
import 'package:flutter_multi_vendor/commons/normal_appbar.dart';
import 'package:flutter_multi_vendor/commons/shimmers/foodlist_shimmer.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/hooks/fetch_foods.dart';
import 'package:flutter_multi_vendor/models/foods/food_model.dart';
import 'package:flutter_multi_vendor/views/home/widgets/food_item_vertical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllRecommendationPage extends HookWidget {
  const AllRecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods(code: 41007428);
    final List<FoodModel>? foods = hookResult.data;
    final bool isLoading = hookResult.isLoading;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: const NormalAppBar(
        title: 'Recommendation Restaurants',
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
                    foods!.length,
                    (index) {
                      var food = foods[index];
                      return FoodItemVertical(food: food);
                    },
                  ),
                ),
        ),
      ),
    );
  }
}
