import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Skill extends StatelessWidget {
  final Color? color;
  final EdgeInsets? padding;
  final EdgeInsets? magin;
  final String skill;

  const Skill({this.color, this.padding, this.magin, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.w),
      decoration: BoxDecoration(
        color: color ?? Colors.grey,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Text(
        skill,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
