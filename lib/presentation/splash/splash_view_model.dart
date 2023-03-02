import 'dart:async';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';

class SplashViewModel extends GetxController {
  bool viewText = false;
  @override
  void onInit() {
    super.onInit();
    viewRedText();
    goToNextView();
  }

  void goToNextView() {
    Timer(const Duration(seconds: 4), () {
      Get.offNamed(RoutesManager.getLoginScreen());
    });
  }

  void viewRedText() {
    Timer(const Duration(seconds: 2), () {
      viewText = true;
      update();
    });
  }
}
