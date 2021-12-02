part of './app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const Register = _Paths.Register;
  static const APP = _Paths.APP;
  static const CHATROOM = _Paths.CHATROOM;
  static const PROJECT = _Paths.PROJECT;
  static const PROJECT_DETAIL = _Paths.PROJECT_DETAIL;
  static const PROJECT_END = _Paths.PROJECT_END;
}

abstract class _Paths {
  // static const HOME = '/home';
  static const LOGIN = '/login';
  static const Register = '/register';
  static const APP = "/main";
  static const CHATROOM = "/chat";
  static const PROJECT = "/project";
  static const PROJECT_DETAIL = "/project/detail";
  static const PROJECT_END = "/project/end";
}
