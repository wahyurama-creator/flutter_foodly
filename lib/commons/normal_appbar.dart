import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/app_style.dart';
import 'package:flutter_multi_vendor/commons/reusable_text_widget.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color? textColor;

  const NormalAppBar({
    super.key,
    required this.title,
    this.backgroundColor = kOffWhite,
    this.textColor = kGray,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      title: ReusableTextWidget(
        text: title,
        style: appStyle(
          fontSize: 13,
          color: textColor ?? kGray,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
