import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/data/data_source/local_data_source.dart';

class SettingsViewModel extends GetxController {
  LocalDataSource localDataSource = Get.find();
  Locale getIntialLang() {
    Locale intialLang;
    if (localDataSource.getString("localLang") == "en") {
      intialLang = const Locale("en");
    } else if (localDataSource.getString("localLang") == "fr") {
      intialLang = const Locale("fr");
    } else if (localDataSource.getString("localLang") == "es") {
      intialLang = const Locale("es");
    } else {
      intialLang = const Locale("en");
    }
    return intialLang;
  }

  void changLang(String codeLang) {
    Locale locale = Locale(codeLang);
    localDataSource.setString("localLang", codeLang);
    Get.updateLocale(locale);
  }

  void checkingController(String index) {
    if (index == "fr") {
      localDataSource.setBool("frChecked", true);
      localDataSource.setBool("enChecked", false);
      localDataSource.setBool("esChecked", false);
      update();
    } else if (index == "en") {
      localDataSource.setBool("frChecked", false);
      localDataSource.setBool("enChecked", true);
      localDataSource.setBool("esChecked", false);
      update();
    } else if (index == "es") {
      localDataSource.setBool("frChecked", false);
      localDataSource.setBool("enChecked", false);
      localDataSource.setBool("esChecked", true);
      update();
    }
  }
}
