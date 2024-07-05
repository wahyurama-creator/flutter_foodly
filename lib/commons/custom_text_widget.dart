import 'package:flutter/material.dart';
import 'package:flutter_multi_vendor/commons/app_style.dart';
import 'package:flutter_multi_vendor/constants/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextWidget extends StatelessWidget {
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmit;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final String? hintText;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  const CustomTextWidget({
    super.key,
    this.keyboardType,
    this.controller,
    this.onEditingComplete,
    this.onSubmit,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.hintText,
    this.textInputAction,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.w),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: keyboardType,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText,
        cursorHeight: 20.h,
        textInputAction: textInputAction ?? TextInputAction.done,
        style: appStyle(
          color: kDark,
          fontSize: 11.sp,
          fontWeight: FontWeight.normal,
        ),
        validator: validator,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.r),
            borderSide: const BorderSide(
              color: kGray,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.r),
            borderSide: const BorderSide(
              color: kGray,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.r),
            borderSide: const BorderSide(
              color: kPrimary,
              width: 1,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintStyle: appStyle(
            color: kDark,
            fontSize: 11.sp,
            fontWeight: FontWeight.normal,
          ),
          hintText: hintText,
        ),
        onFieldSubmitted: onSubmit,
      ),
    );
  }
}