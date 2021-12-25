import 'dart:io';
import 'dart:math';

import 'package:devsload/components/buttons/ModalButton.dart';
import 'package:devsload/components/inputs/InputTextFeild.dart';
import 'package:devsload/components/widget/skill.dart';
import 'package:devsload/models/skill.dart';
import 'package:devsload/screen/Auth/Register/controller/RegisterController.dart';
import 'package:devsload/screen/Auth/Register/view/RegisterSuccessScreen.dart';
import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetView<RegisterController> {
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
          color: AppColor.mainColor.withOpacity(0.1),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40.h),
                  _profile(),
                  SizedBox(height: 20.h),
                  _email(),
                  SizedBox(height: 10.h),
                  _nickName(),
                  SizedBox(height: 10.h),
                  _codingStart(),
                  SizedBox(height: 10.h),
                  _introduction(),
                  SizedBox(height: 10.h),
                  Container(
                    margin: EdgeInsets.only(left: 10.w),
                    child: Row(
                      children: [
                        Text(
                          '기술스택',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 20.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            color: AppColor.mainColor,
                            borderRadius: BorderRadius.circular(3.w),
                          ),
                          child: IconButton(
                            onPressed: () async {
                              controller.skill_pick();
                            },
                            iconSize: 19.sp,
                            padding: EdgeInsets.all(0),
                            icon: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  _skills(),
                  SizedBox(height: 20.h),
                  ModalButton(
                    onClick: () async {
                      if (!controller.process.value)
                        await controller.userRegister();
                    },
                    color: Colors.blue,
                    text: Text(
                      "회원가입",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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

  InputTextField _nickName() {
    return InputTextField(
      child: TextField(
        onChanged: (text) {
          controller.nickNameEnable(false);
        },
        controller: controller.nickNameController,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: AppColor.mainColor,
          ),
          hintText: "nickname",
          border: InputBorder.none,
          suffixIcon: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  child: IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 15.sp,
                    onPressed: () {
                      controller.nickNameController.clear();
                      controller.nickNameEnable(false);
                    },
                    icon: Icon(Icons.clear_rounded, size: 15.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (!controller.process.value &&
                        controller.nickNameController.text.length != 0) {
                      controller.userNickCheck();
                    }
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.w, horizontal: 8.w),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.w),
                    ),
                    child: Text(
                      '중복확인',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Obx _codingStart() {
    return Obx(
      () => Container(
          width: double.infinity,
          child: GestureDetector(
              onTap: () async {
                await controller.startCodingPick();
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.w),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.ac_unit_rounded,
                      color: AppColor.mainColor,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text('${controller.codingStart.value} 년',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ))),
    );
  }

  Obx _skills() {
    return Obx(
      () => Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.w),
        ),
        // margin: EdgeInsets.only(left: 10),
        child: controller.pick_list.length != 0
            ? Container(
                padding: EdgeInsets.all(10.w),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: [
                    ...List.generate(
                      controller.pick_list.length,
                      (index) {
                        return Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 5.w, right: 5.w),
                              child: Skill(
                                skill: controller.pick_list[index].name,
                                color: SkillColor[
                                        controller.pick_list[index].name] ??
                                    Colors.amber,
                              ),
                            ),
                            Positioned(
                              right: 0.w,
                              top: 0.w,
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 8.0.w,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.close),
                                  color: Colors.white,
                                  iconSize: 14.w,
                                  onPressed: () {
                                    controller.skillPickRemove(index);
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList()
                  ],
                ),
              )
            : Container(
                height: 130.w,
                child: Center(
                  child: Text('기술 스택을 추가해주세요.'),
                )),
      ),
    );
  }

  InputTextField _introduction() {
    return InputTextField(
      child: TextField(
        controller: controller.introductionController,
        keyboardType: TextInputType.multiline,
        maxLength: 1000,
        maxLines: 5,
        decoration: InputDecoration(
          hintText: "자기 소개글을 적어주세요.",
          border: InputBorder.none,
        ),
      ),
    );
  }

  InputTextField _email() {
    return InputTextField(
      child: TextField(
        controller: controller.emailController,
        enabled: false,
        decoration: InputDecoration(
          icon: Icon(
            Icons.mail,
            color: AppColor.mainColor,
          ),
          hintText: "email",
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _profile() {
    return Obx(
      () => GestureDetector(
        onTap: () {
          controller.loadImagePicker();
        },
        child: Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            backgroundColor: AppColor.mainColor,
            radius: 45.w,
            child: CircleAvatar(
              backgroundImage: controller.image_path.value != ""
                  ? Image.file(
                      File(controller.image_path.value),
                      fit: BoxFit.cover,
                    ).image
                  : null,
              backgroundColor: Colors.orangeAccent,
              radius: 43.w,
            ),
          ),
        ),
      ),
    );
  }
}
