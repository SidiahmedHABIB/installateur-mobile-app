import 'package:get/get.dart';
import 'package:installateur/presentation/splash/splash_view_model.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    //splash
    Get.put(SplashViewModel());
  }
}
