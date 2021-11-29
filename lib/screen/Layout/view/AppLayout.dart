import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:devsload/screen/Layout/controller/bottomNavController.dart';
import 'package:devsload/styles/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppLayout extends GetView<BottomNaviController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   color: AppColor.BackGroundColor,
      //   child: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: <Widget>[
      //         Obx(
      //           () =>
      //               Text(controller.getPage.toString(), textScaleFactor: 10.0),
      //         ),
      //         ElevatedButton(
      //           child: Text('Go To Page of index 1'),
      //           onPressed: () {
      //             controller.setPage(1);
      //           },
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      body: Obx(() => controller.body_list[controller.getPage]),
      bottomNavigationBar: Obx(
        () => CurvedNavigationBar(
          backgroundColor: AppColor.BackGroundColor,
          index: controller.getPage,
          items: [
            Icon(Icons.perm_identity, size: 30),
            Icon(Icons.chat_bubble_outline, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.feed, size: 30),
            Icon(Icons.groups, size: 30),
          ],
          onTap: (index) {
            controller.setPage(index);
          },
        ),
      ),
    );
  }
}
