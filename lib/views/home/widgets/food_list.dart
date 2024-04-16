import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_vendor/commons/shimmers/nearby_shimmer.dart';
import 'package:flutter_multi_vendor/hooks/fetch_foods.dart';
import 'package:flutter_multi_vendor/models/foods/food_model.dart';
import 'package:flutter_multi_vendor/views/home/widgets/food_item_horizontal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods(code: 41007428);
    final List<FoodModel>? foods = hookResult.data;
    final bool isLoading = hookResult.isLoading;

    return Container(
      height: 184.h,
      padding: EdgeInsets.only(top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                foods!.length,
                (index) {
                  var food = foods[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 12.w : 4.w,
                      right: index == foods.length - 1 ? 12.w : 4.w,
                    ),
                    child: FoodItemHorizontal(
                      image: food.imageUrl.first,
                      title: food.title,
                      time: food.time,
                      price: food.price.toStringAsFixed(2),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
