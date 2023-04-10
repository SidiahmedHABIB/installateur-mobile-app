import 'package:get/get.dart';
import 'package:installateur/presentation/intervention_details/inter_details_view_model.dart';

class InterDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => InterventionDetailsViewModel(Get.find(), Get.find()));
  }
}
