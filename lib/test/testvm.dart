import 'dart:async';

import 'package:get/get.dart';

class testvm extends GetxController {
  double opacityLevel = 0.0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(
      Duration(seconds: 1),
      () => opacityLevel = 1.1,
    );
  }

  void changeOpacity() {
    opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
    update();
  }
}
