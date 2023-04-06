import 'package:get/get.dart';
import 'package:installateur/presentation/drawer/drawer_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DrawerViewModel(Get.find()));
  }
}
