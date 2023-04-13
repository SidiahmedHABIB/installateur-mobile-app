import 'package:get/get.dart';
import 'package:installateur/presentation/box_emplacement/box_emplacement_view_model.dart';

class BoxEmplacementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoxEmplacementViewModel(Get.find()));
  }
}
