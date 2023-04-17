import 'package:get/get.dart';
import 'package:installateur/presentation/box_table/box_table_binding.dart';
import 'package:installateur/presentation/login/login_binding.dart';
import 'package:installateur/presentation/main/home_bindings.dart';
import 'package:installateur/presentation/notices/notice_view.dart';
import 'package:installateur/presentation/profile/profile_binding.dart';
import '../../test/test.dart';
import '../box_details/box_details_binding.dart';
import '../box_details/box_details_view.dart';
import '../box_diagnostic/box_diagnostic_view.dart';
import '../box_emplacement/box_emplacement_binding.dart';
import '../box_emplacement/box_emplacement_view.dart';
import '../box_table/box_table_view.dart';
import '../installation_report/install_report_binding.dart';
import '../intervention_details/inter_details_binding.dart';
import '../intervention_details/inter_details_view.dart';
import '../installation_report/install_report_view.dart';
import '../login/login_view.dart';
import '../main/home_view.dart';
import '../notices/notice_binding.dart';
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
  static const String notice = "/notice-screen";

  static String getSplashScreen() => splashScreen;
  static String getLoginScreen() => loginScreen;
  static String getInitial() => initial;
  static String getProfile() => profile;
  static String gettest() => test;
  static String getSetting() => setting;
  static String getBoxTable(int? companyId) => '$boxTable?companyId=$companyId';
  static String getBoxDetails(int? boxId) => '$boxDetails?boxId=$boxId';
  static String getBoxEmplacement(int? boxId) => '$boxEmplacement?boxId=$boxId';
  static String getBoxDiagnostic() => boxDiagnostic;
  static String getInterDetails(int? interId) =>
      '$interDetails?interId=$interId';
  static String getInterRapport(int? boxId) => '$interRapport?boxId=$boxId';
  static String getNotice(int? companyId) => '$notice?companyId=$companyId';

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
      binding: ProfileBinding(),
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
      page: () {
        var boxId = Get.parameters['boxId'];
        return BoxDetailsView(boxId: int.parse(boxId!));
      },
      binding: BoxDetailsBinding(),
    ),
    GetPage(
      name: boxTable,
      page: () {
        var companyId = Get.parameters['companyId'];
        return BoxTableView(companyId: int.parse(companyId!));
      },
      binding: BoxTableBinding(),
    ),
    GetPage(
        name: boxEmplacement,
        page: () {
          var boxId = Get.parameters['boxId'];
          return BoxEmplacementView(boxId: int.parse(boxId!));
        },
        binding: BoxEmplacementBinding()),
    GetPage(
      name: boxDiagnostic,
      page: () => BoxDiagnosticView(),
    ),
    GetPage(
      name: interDetails,
      page: () {
        var interId = Get.parameters['interId'];
        return InterventionDetailsView(pageId: int.parse(interId!));
      },
      binding: InterDetailsBinding(),
    ),
    GetPage(
      name: interRapport,
      page: () {
        var boxId = Get.parameters['boxId'];
        return InstallationReportView(boxId: int.parse(boxId!));
      },
      binding: InstallationReportBinding(),
    ),
    GetPage(
      name: notice,
      page: () {
        var companyId = Get.parameters['companyId'];
        return NoticesView(companyId: int.parse(companyId!));
      },
      binding: NoticeBinding(),
    ),
  ];
}
