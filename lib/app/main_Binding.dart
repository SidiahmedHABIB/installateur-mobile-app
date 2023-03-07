import 'package:get/get.dart';
import 'package:installateur/presentation/box_table/box_table_view_model.dart';
import 'package:installateur/presentation/splash/splash_view_model.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    //splash
    Get.put(SplashViewModel());
    Get.put(BoxTableViewModel());

    // Get.put(BoxTableViewModel());
    // Get.lazyPut(() => BoxTableViewModel());
  }
}
