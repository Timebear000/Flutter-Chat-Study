import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InputTextField extends StatelessWidget {
  final Widget child;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const InputTextField({required this.child, this.margin, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.symmetric(vertical: 10.w),
      padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.LightMainColor,
        borderRadius: BorderRadius.circular(20.w),
      ),
      child: child,
    );
  }
}
