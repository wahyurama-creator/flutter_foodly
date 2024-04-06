import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/background_container.dart';
import 'package:flutter_multi_vendor/commons/normal_appbar.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/constants/uidata.dart';
import 'package:flutter_multi_vendor/views/home/widgets/category_item_vertical.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: const NormalAppBar(title: 'All Categories'),
      body: BackgroundContainer(
        backgroundColor: Colors.white,
        child: SizedBox(
          height: height,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
            children: List.generate(
              categories.length,
              (index) {
                var category = categories[index];
                return CategoryItemVertical(category: category);
              },
            ),
          ),
        ),
      ),
    );
  }
}
