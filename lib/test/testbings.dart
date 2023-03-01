import 'package:get/get.dart';
import 'package:installateur/test/testvm.dart';

class testbings extends Bindings {
  @override
  void dependencies() {
    Get.put(testvm());
  }
}
