import 'dart:io';

import 'package:devsload/models/myuser.dart';
import 'package:devsload/services/AppAuthService.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppAuthRepository extends GetConnect {
  static AppAuthRepository get to => Get.find();

  @override
  void onInit() {
    print(dotenv.env.toString());
    httpClient.baseUrl = "${dotenv.env["API"]}/auth";
    // // 모든 요청의 헤더에 'X-Auth' 속성을 첨부합니다.
    httpClient.addRequestModifier((Request request) {
      request.headers['x_auth'] = dotenv.env["x_auth"]!;
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  // Token Login
  Future<bool> token_login(
      {required String token, required String device_token}) async {
    final response = await post(
      '/token_login',
      {"_token": token, "_device_token": device_token},
    );
    if (response.hasError) {
      return false;
    }
    MyUser temp_user = MyUser.fromJson(response.body["data"]["user"]);

    String temp_token = response.body["data"]["token"];
    return await AppAuthService.to
        .userSetting(login_user: temp_user, token: temp_token);
  }

  // Common Login
  Future<bool> CommonLogin(
      {required String email,
      required String type,
      required String device_token}) async {
    var body = {
      "email": email,
      "type": type,
      "device_token": device_token,
    };
    var response = await post("/login", body);
    if (response.hasError) {
      return false;
    }
    MyUser user = MyUser.fromJson(response.body["data"]["user"]);
    await AppAuthService.to
        .userSetting(login_user: user, token: response.body["data"]["token"]);
    return true;
  }

  // Register User
  Future<bool> Register(
      {required String email,
      required String type,
      required String nickName,
      required String profile,
      required String skills,
      required String introduce,
      required int start_coding,
      required String device_token}) async {
    var body = {
      "email": email,
      "start_coding": start_coding,
      "type": type,
      "nickName": nickName,
      "profile": profile,
      "skills": skills,
      "introduce": introduce,
      "_device_token": device_token,
    };
    var response = await post('/register', body);
    if (response.hasError) {
      throw new Exception(response.body['message']);
    }
    return true;
  }

  //  Apple Auth
  Future<String> appleLogin(AuthorizationCredentialAppleID credential) async {
    var response = await post('/sign_in_with_apple', {}, query: {
      'code': credential.authorizationCode,
      'firstName': credential.givenName,
      'lastName': credential.familyName,
      'useBundleId': Platform.isIOS ? 'true' : 'false',
      if (credential.state != null) 'state': credential.state,
    });
    if (response.hasError) throw new Exception('애플과의 인증이 정상적으로 처리 되지 않았습니다.');
    return response.body['data']['email'];
  }

  //  Google Auth
  Future<String> googleLogin({required String google_id}) async {
    var response = await post('/google', {'token': google_id});
    if (response.hasError) {
      throw new Exception('구글과의 인증이 정상적으로 처리 되지 않았습니다.');
    }
    return response.body['data']['email'];
  }
}
