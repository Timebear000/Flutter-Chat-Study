import 'package:devsload/screen/Chat/view/ChatListScreen.dart';
import 'package:devsload/screen/Home/view/HomeScreen.dart';
import 'package:devsload/screen/Project/view/ProjectScreen.dart';
import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNaviController extends GetxController {
  Rx<int> _page = 0.obs;

  void setPage(int value) {
    _page(value);
  }

  List<Widget> body_list = [
    HomeScreen(),
    ChatListScreen(),
    ProjectScreen(),
    Scaffold(
      backgroundColor: AppColor.BackGroundColor,
    ),
    Scaffold(
      backgroundColor: AppColor.BackGroundColor,
    ),
  ];

  int get getPage => _page.value;
}
