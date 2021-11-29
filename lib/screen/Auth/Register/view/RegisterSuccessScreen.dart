import 'package:devsload/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterSuccessScreen extends StatelessWidget {
  const RegisterSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xffA1CBE7),
            Color(0xff4B89DC),
          ],
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.w),
            SizedBox(height: 20.h),
            Text(
              '회원가입 완료',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 30.sp,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              '개발자의 길에 가입이 완료되었습니다.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              '개발자의 길은 여러 개발자들과 소통하며 \n여러분들의 발자취를 기록해주는 플랫품입니다.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.toNamed(Routes.APP);
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15),
                  side: BorderSide(
                    color: Colors.white,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.w),
                    ),
                  ),
                ),
                child: Text(
                  '완료',
                  style: TextStyle(
                    fontSize: 17.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
