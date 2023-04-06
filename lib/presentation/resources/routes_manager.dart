import 'package:get/get.dart';
import 'package:installateur/presentation/login/login_binding.dart';
import 'package:installateur/presentation/main/home_bindings.dart';
import '../../test/test.dart';
import '../box_details/box_details_view.dart';
import '../box_diagnostic/box_diagnostic_view.dart';
import '../box_emplacement/box_emplacement_view.dart';
import '../box_table/box_table_view.dart';
import '../intervention_details/inter_details_view.dart';
import '../intervention_rapport/inter_rapport_view.dart';
import '../login/login_view.dart';
import '../main/home_view.dart';
import '../profile/profile_view.dart';
import '../settings/settings_view.dart';
import '../splash/splash_view.dart';

class RoutesManager {
  static const String splashScreen = "/Splash-Screen";
  static const String loginScreen = "/login-Screen";
  static const String initial = "/";
  static const String test = "/test";
  static const String profile = "/profile";
  static const String setting = "/setting";
  static const String boxTable = "/box-table";
  static const String boxDetails = "/box-details";
  static const String boxEmplacement = "/box-emplacement";
  static const String boxDiagnostic = "/box-diagnostic";
  static const String interDetails = "/intervention-details";
  static const String interRapport = "/intervention-rapport";

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getInitial() => initial;
  static String getProfile() => profile;
  static String gettest() => test;
  static String getSetting() => setting;
  static String getBoxTable() => boxTable;
  static String getBoxDetails() => boxDetails;
  static String getBoxEmplacement() => boxEmplacement;
  static String getBoxDiagnostic() => boxDiagnostic;
  static String getInterDetails() => interDetails;
  static String getInterRapport() => interRapport;

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
      binding: HomeBinding(),
    ),
    GetPage(
      name: profile,
      page: () => ProfileView(),
    ),
    GetPage(
      name: loginScreen,
      // page: () => LoginView(contaierHero: "container-hero"),
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: setting,
      page: () => SettingsView(),
    ),
    GetPage(
      name: boxDetails,
      page: () => BoxDetailsView(),
    ),
    GetPage(
      name: boxTable,
      page: () => BoxTableView(),
    ),
    GetPage(
      name: boxEmplacement,
      page: () => BoxEmplacementView(),
    ),
    GetPage(
      name: boxDiagnostic,
      page: () => BoxDiagnosticView(),
    ),
    GetPage(
      name: interDetails,
      page: () => InterventionDetailsView(),
    ),
    GetPage(
      name: interRapport,
      page: () => InterventionRapportView(),
    ),
  ];
}
