import 'dart:io';

import 'package:devsload/components/modals/CustomAlertModal.dart';
import 'package:devsload/routes/app_pages.dart';
import 'package:devsload/services/AppAuthService.dart';
import 'package:devsload/services/AppPushService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();

  Future<void> googleLogin() async {}

  Future<void> appleLogin() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      String email = await AppAuthService.to.appleAuth(credential);
      print(email);
      String device_token = await PushService.to.GetToken();
      bool result = await AppAuthService.to.EmailLogin(
        email: email,
        type: 'apple',
      );

      if (result) {
        return Get.offNamed(Routes.APP);
      } else {
        return Get.toNamed(Routes.Register,
            arguments: {"email": email, "type": "apple"});
      }
    } catch (error) {
      await Get.dialog(
        CustomAlertModal(
            color: Colors.red,
            error: true,
            title: "회원 가입 오류",
            descirption: error.toString()),
        barrierDismissible: false,
      );
    }
  }
}
