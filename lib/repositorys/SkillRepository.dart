import 'package:devsload/models/skill.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class SkillRepository extends GetConnect {
  static SkillRepository get to => Get.find();
  @override
  void onInit() {
    httpClient.baseUrl = "${dotenv.env["API"]}/skills";
    // // 모든 요청의 헤더에 'X-Auth' 속성을 첨부합니다.
    httpClient.addRequestModifier((Request request) {
      request.headers['x_auth'] = dotenv.env["x_auth"]!;
      request.headers['Content-Type'] = 'application/json';
      return request;
    });
    super.onInit();
  }

  // 전체 목록 표시
  Future<List<SkillModel>> skill_list() async {
    var response = await get('/all');
    if (response.hasError) {
      throw new Exception(response.body['message']);
    }
    if (response.body['data'].length == 0) {
      return [];
    } else {
      return List<SkillModel>.from(
          response.body["data"].map((x) => SkillModel.fromJson(x)));
    }
  }

  // 한개 추가하기
  Future<SkillModel> skill_create(String name) async {
    var response = await post('/create', {"name": name});
    if (response.hasError) {
      throw new Exception(response.body['messagee']);
    }
    return SkillModel.fromJson(response.body['data']);
  }
}
