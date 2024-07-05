import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/controllers/search_food_controller.dart';
import 'package:flutter_multi_vendor/views/home/widgets/food_item_vertical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());

    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 0),
      height: height,
      child: ListView.builder(
        itemCount: controller.searchResults!.length,
        itemBuilder: (context, index) {
          final food = controller.searchResults![index];
          return FoodItemVertical(food: food);
        },
      ),
    );
  }
}