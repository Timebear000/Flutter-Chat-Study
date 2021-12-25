import 'dart:io';

import 'package:dio/dio.dart' as DIO;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetConnect {
  static UserRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "${dotenv.env["API"]}/users";
    // // 모든 요청의 헤더에 'X-Auth' 속성을 첨부합니다.
    httpClient.addRequestModifier((Request request) {
      request.headers['x_auth'] = dotenv.env["x_auth"]!;
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  Future<String> profileUpload({required XFile image}) async {
    String file_upload_url = "${dotenv.env["API"]}/users/profile/upload";
    String header_x_auth = dotenv.env["x_auth"]!;
    String filename = image.name.toString().toLowerCase();
    DIO.MultipartFile profile =
        await DIO.MultipartFile.fromFile(image.path, filename: filename);
    DIO.FormData formData = DIO.FormData.fromMap({
      "profile": profile,
    });
    final response = await DIO.Dio().post(file_upload_url,
        data: formData,
        options: DIO.Options(headers: {"x_auth": header_x_auth}));
    if (response.statusCode != 201) {
      throw new Exception(response.data["message"]);
    }
    return response.data["data"];
  }

  Future<bool> nickNameCheck({required String nickName}) async {
    var response = await get("/nickNameCheck/${nickName}");
    if (response.hasError) {
      throw new Exception(response.body["message"]);
    }
    return response.body["data"];
  }
}
