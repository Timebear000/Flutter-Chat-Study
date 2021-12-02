import 'package:devsload/screen/Auth/Login/view/LoginScreen.dart';
import 'package:devsload/screen/Auth/Register/view/RegisterScreen.dart';
import 'package:devsload/screen/Chat/view/ChatRoomScreen.dart';
import 'package:devsload/screen/Layout/controller/bottomNavController.dart';
import 'package:devsload/screen/Layout/view/AppLayout.dart';
import 'package:devsload/screen/Project/view/ProjectDetailScreen.dart';
import 'package:devsload/screen/Project/view/ProjectEndScreen.dart';
import 'package:devsload/screen/Project/view/ProjectScreen.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;
  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: _Paths.Register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: _Paths.APP,
      page: () => AppLayout(),
      binding: BindingsBuilder(
        () => Get.put<BottomNaviController>(
          BottomNaviController(),
        ),
      ),
    ),
    GetPage(
      name: "${_Paths.CHATROOM}/:id",
      page: () => ChatRoomScreen(),
    ),
    GetPage(name: _Paths.PROJECT, page: () => ProjectScreen()),
    GetPage(
      name: "${_Paths.PROJECT_DETAIL}/:id",
      page: () => ProjectDetailScreen(),
    ),
    GetPage(
      name: "${_Paths.PROJECT_END}/:id",
      page: () => ProjectEndScreen(),
    ),
  ];
}
