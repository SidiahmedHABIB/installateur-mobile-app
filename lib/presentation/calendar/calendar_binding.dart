import 'package:get/get.dart';

import 'calendar_view_model.dart';

class CalendarBingding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalendarViewModel(Get.find(), Get.find()));
  }
}
