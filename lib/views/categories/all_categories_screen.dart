import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_vendor/commons/background_container.dart';
import 'package:flutter_multi_vendor/commons/normal_appbar.dart';
import 'package:flutter_multi_vendor/commons/shimmers/foodlist_shimmer.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/hooks/fetch_all_categories.dart';
import 'package:flutter_multi_vendor/models/categories/categories_model.dart';
import 'package:flutter_multi_vendor/views/home/widgets/category_item_vertical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesScreen extends HookWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllCategories();
    final List<CategoriesModel>? categoriesItem = hookResult.data;
    final isLoading = hookResult.isLoading;

    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: const NormalAppBar(title: 'All Categories'),
      body: BackgroundContainer(
        backgroundColor: Colors.white,
        child: SizedBox(
          height: height,
          child: isLoading ? const FoodsListShimmer() : ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            children: List.generate(
              categoriesItem!.length,
              (index) {
                final category = categoriesItem[index];
                return CategoryItemVertical(category: category);
              },
            ),
          ),
        ),
      ),
    );
  }
}
