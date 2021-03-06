import 'package:devsload/bindings/init_binding.dart';
import 'package:devsload/repositorys/AuthRepository.dart';
import 'package:devsload/routes/app_pages.dart';
import 'package:devsload/services/AppAuthService.dart';
import 'package:devsload/services/AppPushService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await dotenv.load(fileName: ".env");
  await initService();

  runApp(const DevLoad());
}

Future<void> initService() async {
  // Auth Service
  await Get.putAsync(() async => await AppAuthRepository(), permanent: true);
  await Get.putAsync(() async => await AppAuthService());
  await Get.putAsync(() async => await PushService());
}

class DevLoad extends StatefulWidget {
  const DevLoad({Key? key}) : super(key: key);

  @override
  State<DevLoad> createState() => _DevLoadState();
}

class _DevLoadState extends State<DevLoad> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: () => GetMaterialApp(
        initialBinding: InitBinding(),
        locale: Locale('ko', 'KR'), // 해당 지역의 번역이 표시
        fallbackLocale: Locale('ko', 'KR'),
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ko', 'KR'),
        ],
        theme: ThemeData(
          appBarTheme: AppBarTheme(brightness: Brightness.light),
          scaffoldBackgroundColor: Colors.white,
        ),
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget ?? Container(),
          );
        },
        // initialBinding: InitBinding(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/login",
        getPages: AppPages.routes,
      ),
    );
  }
}
