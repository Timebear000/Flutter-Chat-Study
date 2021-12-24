import 'dart:async';

import 'package:devsload/models/myuser.dart';
import 'package:devsload/repositorys/AuthRepository.dart';
import 'package:devsload/services/AppPushService.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppAuthService extends GetxService {
  static AppAuthService get to => Get.find();
  late MyUser user;
  late SharedPreferences _storage;

  @override
  void onInit() async {
    _storage = await SharedPreferences.getInstance();
    String token = await this.getToken();
    if (token != "") {
      // Token Login Process
      await this.TokenLogin();
    }
    super.onInit();
  }

  FutureOr<String> getToken() async => _storage.getString("token") ?? "";
  Future<void> setToken(String token) async =>
      await _storage.setString("token", token);
  Future<void> delToken() async => await _storage.remove("token");

  //  user Setting
  Future<bool> userSetting(
      {required MyUser login_user, required String token}) async {
    user = login_user;
    await this.setToken(token);
    return true;
  }

  // token_login,
  Future<bool> TokenLogin() async {
    String device_token = await PushService.to.GetToken();
    String token = await this.getToken();
    bool result = await AppAuthRepository.to
        .token_login(token: token, device_token: device_token);
    return result;
  }

  // common_login
  Future<bool> EmailLogin({
    required String email,
    required String type,
  }) async {
    String device_token = await PushService.to.GetToken();
    bool result = await AppAuthRepository.to
        .CommonLogin(email: email, type: type, device_token: device_token);
    return result;
  }

  // Apple Auth
  Future<String> appleAuth(AuthorizationCredentialAppleID credential) async {
    return await AppAuthRepository.to.appleLogin(credential);
  }
  // Google Auth
  // Getter

}
