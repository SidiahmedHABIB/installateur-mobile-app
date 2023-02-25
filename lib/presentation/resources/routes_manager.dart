import 'package:get/get.dart';
import 'package:installateur/presentation/main/home_view.dart';
import 'package:installateur/presentation/settings/settings_view.dart';
import '../../test.dart';
import '../login/login_view.dart';
import '../profile/profile_view.dart';
import '../splash/splash_view.dart';

class RoutesManager {
  static const String splashScreen = "/Splash-Screen";
  static const String loginScreen = "/login-Screen";
  static const String initial = "/";
  static const String test = "/test";
  static const String profile = "/profile";
  static const String setting = "/setting";

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getInitial() => initial;
  static String getProfile() => profile;
  static String gettest() => test;
  static String getSetting() => setting;

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashView(),
    ),
    GetPage(
      name: test,
      page: () => Test(),
    ),
    GetPage(
      name: initial,
      page: () => HomeView(),
    ),
    GetPage(
      name: profile,
      page: () => ProfileView(),
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginView(),
    ),
    GetPage(
      name: setting,
      page: () => SettingsView(),
    ),
  ];
}
