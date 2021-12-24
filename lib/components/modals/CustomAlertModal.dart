import 'package:devsload/components/buttons/ModalButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAlertModal extends StatelessWidget {
  final String title;
  final String descirption;
  final Color color;
  final bool error;
  const CustomAlertModal(
      {required this.title,
      required this.descirption,
      required this.color,
      this.error = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0.w)),
      child: Container(
        width: 200.w,
        height: 320.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 1,
              offset: Offset(0, 5),
            )
          ],
        ),
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 3),
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 2,
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: this.color,
                radius: 20.w,
                child: this.error
                    ? Icon(
                        Icons.clear_rounded,
                        color: Colors.white,
                      )
                    : Icon(Icons.check_rounded, color: Colors.white),
              ),
            ),
            Text(title,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: this.color,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 2.0),
                        blurRadius: 3.0,
                        color: this.color.withOpacity(0.3),
                      ),
                    ])),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Text(
                descirption,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[400],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ModalButton(
              color: this.color,
              text: Text(
                "확인",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onClick: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
