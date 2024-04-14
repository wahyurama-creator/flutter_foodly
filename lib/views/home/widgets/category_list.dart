import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_multi_vendor/commons/shimmers/categories_shimmer.dart';
import 'package:flutter_multi_vendor/hooks/fetch_categories.dart';
import 'package:flutter_multi_vendor/models/categories/categories_model.dart';
import 'package:flutter_multi_vendor/views/home/widgets/category_item_horizontal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    final List<CategoriesModel>?categoryList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return Container(
      height: 80.h,
      padding: EdgeInsets.only(top: 10.h),
      child: isLoading ? const CategoriesShimmer() : ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          categoryList!.length,
          (index) {
            CategoriesModel category = categoryList[index];
            return CategoryItemHorizontal(
                    category: category,
                    index: index,
                  );
          },
        ),
      ),
    );
  }
}
