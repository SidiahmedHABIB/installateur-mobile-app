import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/main_Binding.dart';
import 'package:installateur/app/translation.dart';
import 'package:installateur/presentation/box_emplacement/box_emplacement_view.dart';
import 'package:installateur/presentation/intervention_details/inter_details_view.dart';
import 'package:installateur/presentation/main/home_view.dart';
import 'package:installateur/presentation/splash/splash_view.dart';
import '../presentation/box_table/box_table_view.dart';
import '../presentation/intervention_rapport/inter_rapport_view.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/settings/settings_view_model.dart';
import '../test/testbings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
      // home: SplashView(),

      getPages: RoutesManager.routes,
      initialRoute: RoutesManager.getSplashScreen(),
    );
  }
}
