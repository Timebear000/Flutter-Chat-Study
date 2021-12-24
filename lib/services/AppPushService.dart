import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class PushService extends GetxService {
  static PushService get to => Get.find();
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  @override
  void onInit() async {
    super.onInit();
    print(await GetToken());
    await _initNotification();
    _pushNotificationLisner();
  }

  Future<String> GetToken() async {
    String? token = await _messaging.getToken();
    return token!;
  }

  Future<void> _initNotification() async {
    //권한 설정
    if (Platform.isIOS) {
      NotificationSettings settings = await _messaging.requestPermission();
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        _messaging.subscribeToTopic("notification");
      }
    } else {
      _messaging.subscribeToTopic("notification");
    }

    // //리스너 셋팅
    // _messaging
  }

  void _pushNotificationLisner() {
    // 이 앱이 켜지고 다른 앱을 경유하고 있을 떄 발생
    FirebaseMessaging.onBackgroundMessage((RemoteMessage remoteMessage) async {
      // await Firebase.initializeApp();
      // print("on BackgrundMessage");
      // await Get.dialog(
      //     CustomAlertModal(title: "Background Message", msg: "앱 종료후.."));
      // Get.snackbar(
      //     remoteMessage.notification!.title!, remoteMessage.notification!.body!,
      //     duration: Duration(seconds: 3));
    });
    // 앱 안에서 ..
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) {
      // print("on onMessage");
      // //공지 => 공지리스트 화면이 아니면 스네이크바 화면
      // Get.snackbar(
      //   remoteMessage.notification!.title!,
      //   remoteMessage.notification!.body!,
      //   duration: Duration(seconds: 3),
      //   onTap: (_) async {
      //     await Get.dialog(
      //         CustomAlertModal(title: "Background Message", msg: "앱 종료후.."));
      //   },
      // );

      // 채팅이면 채팅리스트 화면
    });
    // 알림을 클릭한 후 앱으로 들어왔을떄
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      // 공지이면 공지로 이동
      // Get.dialog(CustomAlertModal(title: "Background Message", msg: "앱 종료후.."));

      // 채팅창이면 채팅창 리스트 화면
    });
  }
}
