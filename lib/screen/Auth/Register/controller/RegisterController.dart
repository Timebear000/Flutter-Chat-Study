import 'package:devsload/components/modals/CustomAlertModal.dart';
import 'package:devsload/components/modals/NumberPickModal.dart';
import 'package:devsload/components/modals/SkillPickModal.dart';
import 'package:devsload/models/skill.dart';
import 'package:devsload/repositorys/UserRepository.dart';
import 'package:devsload/screen/Auth/Register/view/RegisterSuccessScreen.dart';
import 'package:devsload/services/AppAuthService.dart';
import 'package:devsload/services/AppPushService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class RegisterController extends GetxController {
  static RegisterController get to => Get.find();

  late XFile file;
  Rx<String> image_path = "".obs;
  String type = Get.arguments['type'];
  TextEditingController emailController =
      TextEditingController(text: Get.arguments['email']);
  TextEditingController nickNameController = TextEditingController();
  TextEditingController introductionController = TextEditingController();
  RxList<SkillModel> _pick_models = <SkillModel>[].obs;
  Rx<bool> nickNameEnable = false.obs;
  Rx<int> codingStart = 2021.obs;
  Rx<bool> process = false.obs;
  Future<void> skill_pick() async {
    List<SkillModel> results =
        await Get.dialog(SkillPickModal(list: _pick_models.toList()));
    _pick_models.assignAll(results);
  }

  void skillPickRemove(int index) {
    _pick_models.removeAt(index);
  }

  //* Load Image Select  Picker
  Future<void> loadImagePicker() async {
    String error = 'No Error Detected';
    //권한 한번 더 체크
    try {
      XFile? imagepicker =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagepicker == null) {
        return;
      }
      String filename = imagepicker.name.split(".").last;

      if (filename != "png" && filename != 'jpg' && filename != 'jpeg') {
        return null;
      }

      image_path(imagepicker.path);
      file = imagepicker;
    } on Exception catch (e) {
      error = e.toString();

      if (await Permission.photos.status.isPermanentlyDenied ||
          await Permission.photos.status.isDenied) {
        await Get.dialog(
          CustomAlertModal(
            title: "권한오류",
            descirption: error.toString(),
            color: Colors.red,
            error: true,
          ),
        );
        openAppSettings();
      } else {
        await Get.dialog(CustomAlertModal(
            title: "오류",
            descirption: error.toString(),
            color: Colors.red,
            error: true));
      }
    }
  }

  // * Coding Start
  Future<void> startCodingPick() async {
    process(true);
    int result = await Get.dialog(
        NumberPickModal(
          startNumber: 1950,
          endNumber: 2022,
          initNumber: codingStart.value,
        ),
        barrierDismissible: true);
    codingStart(result);
    process(false);
  }

  //* NickName Duple Check
  Future<void> userNickCheck() async {
    process(true);
    try {
      bool result = await UserRepository.to
          .nickNameCheck(nickName: nickNameController.text);

      await Get.dialog(CustomAlertModal(
          title: "닉네임 중복검사",
          descirption: !result ? "사용 가능한 닉네임입니다." : "이미 사용중인 닉네임입니다.",
          color: !result ? Colors.green : Colors.red));
      nickNameEnable(!result);
    } catch (error) {
      await Get.dialog(CustomAlertModal(
          title: "서버오류",
          descirption: error.toString(),
          color: Colors.red,
          error: true));
    } finally {
      process(false);
    }
  }

  Future<void> userRegister() async {
    try {
      process(true);
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(emailController.text);
      if (file == null) throw new Exception("프로필 파일은 필수입니다.");
      if (!emailValid) throw new Exception("이메일 형식이 잘못되었습니다.");
      if (!nickNameEnable.value) throw new Exception("이메일 중복검사를 진행해 주세요.");
      if (introductionController.text.length <= 10)
        throw new Exception("자기 소개 글은 10글자 이상 작성하셔야 합니다.");
      if (_pick_models.length == 0)
        throw new Exception("기술 스택은 하나 이상 선택해주셔야 합니다.");
      List<String> skills = _pick_models.map((e) => e.id).toList();
      String profile = await UserRepository.to.profileUpload(image: file);
      bool result = await AppAuthService.to.userRegister(
          email: emailController.text,
          type: type,
          nickName: nickNameController.text,
          profile: profile,
          skills: skills,
          introduce: introductionController.text,
          start_coding: codingStart.value,
          device_token: await PushService.to.GetToken());
      print(result);
      if (result) {
        Get.to(RegisterSuccessScreen());
      }
    } catch (error) {
      await Get.dialog(
        CustomAlertModal(
          title: '회원 가입 오류',
          descirption: error.toString(),
          color: Colors.red,
          error: true,
        ),
      );
    } finally {
      process(false);
    }
  }

  List<SkillModel> get pick_list => _pick_models.toList();
}
