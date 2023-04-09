import 'dart:async';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/data/data_source/local_data_source.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';

class SplashViewModel extends GetxController {
  final LocalDataSource _localDataSource;

  bool viewText = false;

  SplashViewModel(this._localDataSource);
  @override
  void onInit() {
    super.onInit();
    viewRedText();
    goToNextView();
  }

  void goToNextView() {
    Timer(const Duration(seconds: 4), () {
      _localDataSource.getString(AppConstants.USER_TOKEN) != ""
          ? Get.offNamed(RoutesManager.getInitial())
          : Get.offNamed(RoutesManager.getLoginScreen());
    });
  }

  void viewRedText() {
    Timer(const Duration(seconds: 2), () {
      viewText = true;
      update();
    });
  }
}
