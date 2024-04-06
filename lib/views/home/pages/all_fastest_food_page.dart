import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/background_container.dart';
import 'package:flutter_multi_vendor/commons/normal_appbar.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/constants/uidata.dart';
import 'package:flutter_multi_vendor/views/home/widgets/food_item_vertical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllFastestFoodPage extends StatelessWidget {
  const AllFastestFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: const NormalAppBar(
        title: 'Fast Food Restaurants',
        backgroundColor: kSecondary,
        textColor: kLightWhite,
      ),
      body: SafeArea(
        child: BackgroundContainer(
          child: ListView(
            padding: EdgeInsets.all(12.h),
            children: List.generate(
              foods.length,
              (index) {
                var food = foods[index];
                return FoodItemVertical(
                  food: food,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
