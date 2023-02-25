import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/intervention_details/inter_details_view.dart';
import 'package:installateur/presentation/login/login_view.dart';
import 'package:installateur/presentation/main/home_view.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/splash/splash_view.dart';
import 'package:installateur/test.dart';

import 'presentation/box_details/box_details_view.dart';
import 'presentation/box_diagnostic/box_diagnostic_view.dart';
import 'presentation/box_emplacement/box_emplacement_view.dart';
import 'presentation/box_table/box_table_view.dart';
import 'presentation/intervention_rapport/inter_rapport_view.dart';
import 'presentation/profile/profile_view.dart';

void main() {
  runApp(const MyApp());
}

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
      // home: ProfileView(),
      getPages: RoutesManager.routes,
      initialRoute: RoutesManager.getInitial(),

      // initialRoute: "/",
      // routes: {
      //   "/": (context) => HomeView(),
      //   "/counter": (context) => ProfileView(),
      //   "/meteo": (context) => InterventionDetailsView(),
      //   "/gallery": (context) => BoxTableView(),
      //   // "/users": (context) => UsersPage(),
      //   // "/calculator": (context) => CalculatorPage(),
      //   // "/tiktok": (context) => TiktokPage(),
      //   // "/elmadrasa": (context) => Elmadrasa(),
      // },
    );
  }
}
