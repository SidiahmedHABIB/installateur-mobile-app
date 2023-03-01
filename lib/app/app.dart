import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/app/translation.dart';
import 'package:installateur/presentation/box_details/box_details_view.dart';
import 'package:installateur/presentation/box_diagnostic/box_diagnostic_view.dart';
import 'package:installateur/presentation/box_emplacement/box_emplacement_view.dart';
import 'package:installateur/presentation/intervention_details/inter_details_view.dart';
import 'package:installateur/presentation/main/home_view.dart';
import '../presentation/box_table/box_table_view.dart';
import '../presentation/intervention_rapport/inter_rapport_view.dart';
import '../presentation/resources/routes_manager.dart';
import '../test/testbings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      translations: Translation(),
      initialBinding: testbings(),
      // home: HomeView(),

      getPages: RoutesManager.routes,
      initialRoute: RoutesManager.getInitial(),
    );
  }
}
