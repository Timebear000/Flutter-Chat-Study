part of './app_pages.dart';

abstract class Routes {
  Routes._();

  static const LOGIN = _Paths.LOGIN;
  static const Register = _Paths.Register;
  static const APP = _Paths.APP;
  static const CHATROOM = _Paths.CHATROOM;
}

abstract class _Paths {
  // static const HOME = '/home';
  static const LOGIN = '/login';
  static const Register = '/register';
  static const APP = "/main";
  static const CHATROOM = "/chat";
}
