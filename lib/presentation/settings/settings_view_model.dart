import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../main.dart';

class SettingsViewModel extends GetxController {
  Locale getIntialLang() {
    Locale intialLang;
    if (sharedPreferences.getString("localLang") == "en") {
      intialLang = const Locale("en");
    } else if (sharedPreferences.getString("localLang") == "fr") {
      intialLang = const Locale("fr");
    } else if (sharedPreferences.getString("localLang") == "es") {
      intialLang = const Locale("es");
    } else {
      intialLang = const Locale("en");
    }
    return intialLang;
  }

  void changLang(String codeLang) {
    Locale locale = Locale(codeLang);
    sharedPreferences.setString("localLang", codeLang);
    Get.updateLocale(locale);
  }

  void checkingController(String index) {
    if (index == "fr") {
      sharedPreferences.setBool("frChecked", true);
      sharedPreferences.setBool("enChecked", false);
      sharedPreferences.setBool("esChecked", false);
      update();
    } else if (index == "en") {
      sharedPreferences.setBool("frChecked", false);
      sharedPreferences.setBool("enChecked", true);
      sharedPreferences.setBool("esChecked", false);
      update();
    } else if (index == "es") {
      sharedPreferences.setBool("frChecked", false);
      sharedPreferences.setBool("enChecked", false);
      sharedPreferences.setBool("esChecked", true);
      update();
    }
  }
}
