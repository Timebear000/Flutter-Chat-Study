import 'dart:math';

import 'package:devsload/components/inputs/InputTextFeild.dart';
import 'package:devsload/components/widget/skill.dart';
import 'package:devsload/screen/Auth/Register/view/RegisterSuccessScreen.dart';
import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  List<String> stack_list = [
    "C",
    "C++",
    "C#",
    "Node",
    "Express",
    "Nest.js",
    "Nuxt.js",
    "Spring",
    "Java",
    "Flask",
    "Firebase",
    'Next.js',
    'Vue.js',
    'Python',
    'Django',
  ];

  List<Color> colorList = [
    Colors.orangeAccent,
    Colors.lightBlueAccent,
    Colors.purpleAccent,
    Colors.greenAccent,
    Colors.tealAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 60.h),
                  Container(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: AppColor.mainColor,
                      radius: 85.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.orangeAccent,
                        radius: 80.w,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  InputTextField(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.mail,
                          color: AppColor.mainColor,
                        ),
                        hintText: "email",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  InputTextField(
                    child: TextField(
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: AppColor.mainColor,
                        ),
                        hintText: "nickname",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: Text(
                      'MySelf',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  InputTextField(
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLength: 1000,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "myself",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [
                        Text(
                          'Stack',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.LightMainColor,
                            borderRadius: BorderRadius.circular(10.w),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            iconSize: 26.sp,
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.add, color: Colors.white),
                            color: AppColor.LightMainColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10),
                    child: Wrap(
                      spacing: 10.0,
                      runSpacing: 10.0,
                      children: [
                        ...List.generate(
                          stack_list.length,
                          (index) {
                            int ran = Random().nextInt(colorList.length);
                            return Stack(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.only(top: 5.w, right: 5.w),
                                  child: Skill(
                                      skill: stack_list[index],
                                      color: colorList[ran]),
                                ),
                                Positioned(
                                  right: 0.w,
                                  top: 0.w,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.grey,
                                    radius: 8.0.w,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 12.w,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList()
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: AppColor.mainColor,
                    ),
                    child: ElevatedButton(
                      onPressed: () async {
// Get.toNamed("/register")
                        Get.to(RegisterSuccessScreen());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        padding: EdgeInsets.symmetric(vertical: 15.w),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.w))),
                      ),
                      child: Text("Register"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
