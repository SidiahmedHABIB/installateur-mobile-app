import 'package:get/get.dart';
import 'package:installateur/presentation/box_details/box_details_view_model.dart';

class BoxDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BoxDetailsViewModel(Get.find()));
  }
}
