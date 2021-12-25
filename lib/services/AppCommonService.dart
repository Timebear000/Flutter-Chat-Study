import 'package:devsload/components/widget/skill.dart';
import 'package:devsload/models/skill.dart';
import 'package:devsload/repositorys/SkillRepository.dart';
import 'package:get/get.dart';

class AppCommonService extends GetxService {
  static AppCommonService get to => Get.find();
  RxList<SkillModel> skill_list = <SkillModel>[].obs;

  @override
  void onInit() async {
    await this.get_skill_list();
    super.onInit();
  }

  // Service SKill Model Import
  Future<void> get_skill_list() async {
    skill_list.addAll(await SkillRepository.to.skill_list());
  }

  Future<void> skill_create(String name) async {
    skill_list.add(await SkillRepository.to.skill_create(name));
  }
}
