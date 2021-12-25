import 'package:devsload/components/modals/CustomAlertModal.dart';
import 'package:devsload/routes/app_pages.dart';
import 'package:devsload/screen/Auth/Login/controller/LoginController.dart';
import 'package:devsload/styles/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffA1CBE7),
                  Color(0xff4B89DC),
                ],
              ),
            ),
          ),
          Opacity(
            opacity: 0.1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(child: Container(height: 150.w)),
                Container(
                  width: double.infinity,
                  child: Text(
                    'Dev Load',
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(child: Container(height: 100.w)),
                Container(
                  width: double.infinity,
                  height: 120.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/dev_main_img.png"),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(child: Container(height: 150.w)),
                _loginButton(
                  background: Colors.white,
                  icon: ICON_AUTH["google"]!,
                  text: 'Sign in with Google',
                  onTap: () async {
                    if (controller.click_on.value) {
                      await controller.googleLogin();
                    }
                  },
                  textColor: Colors.black87,
                ),
                SizedBox(child: Container(height: 20.w)),
                _loginButton(
                  background: Colors.black,
                  icon: ICON_AUTH["apple"]!,
                  text: 'Sign in with Apple',
                  onTap: () async {
                    if (controller.click_on.value) {
                      await controller.appleLogin();
                    }
                  },
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _loginButton({
    required Color background,
    required Color textColor,
    required String text,
    required String icon,
    required Function onTap,
  }) {
    return Container(
      width: double.infinity,
      height: 40.h,
      child: OutlinedButton.icon(
        onPressed: () {
          onTap();
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: background,
          padding: EdgeInsets.symmetric(vertical: 15.w),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.w))),
        ),
        icon: Container(
          width: 18.w,
          height: 18.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(icon),
              fit: BoxFit.fill,
            ),
          ),
        ),
        label: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
