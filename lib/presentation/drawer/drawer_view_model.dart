import 'package:get/get.dart';
import 'package:installateur/main.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';

class DrawerViewModel {
  Future<void> logout() async {
    sharedPreferences
        .clear()
        .then((value) => Get.offNamed(RoutesManager.getLoginScreen()));
  }
}
