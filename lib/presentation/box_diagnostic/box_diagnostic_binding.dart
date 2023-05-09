import 'package:get/get.dart';
import 'package:installateur/presentation/box_diagnostic/box_diagnostic_view_model.dart';

class BoxDiagnosticBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BoxDiagnosticViewModel(Get.find()));
  }
}
