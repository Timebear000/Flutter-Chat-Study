import 'package:devsload/models/skill.dart';
import 'package:get/get.dart';

class SkillRepository extends GetConnect {
  static SkillRepository get to => Get.find();
  @override
  void onInit() {
    super.onInit();
  }

  // 전체 목록 표시
  Future<List<Skill>> get_skill_list() {}

  // 한개 추가하기

}
