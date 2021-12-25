import 'package:devsload/repositorys/AuthRepository.dart';
import 'package:devsload/repositorys/SkillRepository.dart';
import 'package:devsload/repositorys/UserRepository.dart';
import 'package:devsload/services/AppCommonService.dart';
import 'package:get/get.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(UserRepository(), permanent: true);
    Get.put(SkillRepository(), permanent: true);
    Get.put(AppCommonService(), permanent: true);
    // Get.put()
  }
}
