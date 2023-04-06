import 'package:get/get.dart';
import 'package:installateur/presentation/login/login_view_model.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel(Get.find()));
  }
}
