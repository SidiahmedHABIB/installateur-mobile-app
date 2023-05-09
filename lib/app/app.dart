import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/app_constants.dart';
import 'package:installateur/app/main_Binding.dart';
import 'package:installateur/app/translation.dart';
import 'package:installateur/main.dart';
import '../data/data_source/local_data_source.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/settings/settings_view_model.dart';
import '../test/test.dart';
import '../test/testbings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LocalDataSource());
    SettingsViewModel langController = Get.put(SettingsViewModel());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: MainBinding(),
      locale: langController.getIntialLang(),
      translations: Translation(),
      //home: CalenderView(),

      getPages: RoutesManager.routes,
      initialRoute: RoutesManager.getSplashScreen(),
    );
  }
}
