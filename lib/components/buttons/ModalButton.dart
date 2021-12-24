import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModalButton extends StatelessWidget {
  final Function onClick;
  final Color color;
  final Text text;
  const ModalButton(
      {required this.onClick, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        this.onClick();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          color: this.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: this.text,
      ),
    );
  }
}
