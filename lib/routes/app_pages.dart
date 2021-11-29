import 'package:devsload/screen/Auth/Login/view/LoginScreen.dart';
import 'package:devsload/screen/Auth/Register/view/RegisterScreen.dart';
import 'package:devsload/screen/Layout/controller/bottomNavController.dart';
import 'package:devsload/screen/Layout/view/AppLayout.dart';
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
  ];
}
