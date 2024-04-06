import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/app_style.dart';
import 'package:flutter_multi_vendor/commons/reusable_text_widget.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_multi_vendor/views/categories/category_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryItemVertical extends StatelessWidget {
  final dynamic category;

  const CategoryItemVertical({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category['imageUrl'],
          fit: BoxFit.contain,
          width: 24.w,
        ),
      ),
      title: ReusableTextWidget(
        text: category['title'],
        style: appStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15.r,
      ),
      onTap: () {
        Get.to(
          const CategoryScreen(),
          transition: Transition.rightToLeftWithFade,
        );
      },
    );
  }
}
