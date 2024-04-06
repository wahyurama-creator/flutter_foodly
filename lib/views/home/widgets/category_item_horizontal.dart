import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/app_style.dart';
import 'package:flutter_multi_vendor/commons/reusable_text_widget.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/constants/uidata.dart';
import 'package:flutter_multi_vendor/controllers/category_controller.dart';
import 'package:flutter_multi_vendor/views/categories/all_categories_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryItemHorizontal extends StatelessWidget {
  final dynamic category;
  final int index;

  const CategoryItemHorizontal({
    super.key,
    this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return GestureDetector(
      onTap: () {
        if (controller.category == category['_id']) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category['value'] == 'more') {
          Get.to(
            () => const AllCategoriesScreen(),
            transition: Transition.rightToLeftWithFade,
          );
        } else {
          controller.updateCategory = category['_id'];
          controller.updateTitle = category['title'];
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(
            left: index == 0 ? 12.w : 4.w,
            right: index == categories.length - 1 ? 12.w : 4.w,
          ),
          padding: EdgeInsets.only(top: 4.h),
          width: width * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: controller.category == category['_id']
                  ? kSecondary
                  : kOffWhite,
              width: .5.w,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
                child: Image.network(
                  category['imageUrl'],
                  fit: BoxFit.contain,
                ),
              ),
              ReusableTextWidget(
                text: category['title'],
                style: appStyle(
                  fontSize: 12,
                  color: kDark,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
