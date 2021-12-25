import 'dart:io';

import 'package:devsload/components/modals/CustomAlertModal.dart';
import 'package:devsload/routes/app_pages.dart';
import 'package:devsload/services/AppAuthService.dart';
import 'package:devsload/services/AppPushService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  Rx<bool> click_on = true.obs;

  Future<void> googleLogin() async {
    try {
      click_on(false);
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      String email =
          await AppAuthService.to.googleAuth(token: googleKey.idToken!);

      String device_token = await PushService.to.GetToken();
      bool result = await AppAuthService.to.EmailLogin(
        email: email,
        type: 'Google',
      );

      if (result) {
        return Get.offNamed(Routes.APP);
      } else {
        return Get.toNamed(Routes.Register,
            arguments: {"email": email, "type": "Google"});
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
    } finally {
      click_on(true);
    }
  }

  Future<void> appleLogin() async {
    try {
      click_on(false);
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
        type: 'Apple',
      );

      if (result) {
        return Get.offNamed(Routes.APP);
      } else {
        return Get.toNamed(Routes.Register,
            arguments: {"email": email, "type": "Apple"});
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
    } finally {
      click_on(true);
    }
  }
}
