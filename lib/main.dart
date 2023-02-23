import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/intervention_details.dart/inter_details_view.dart';
import 'package:installateur/presentation/login/login_view.dart';
import 'package:installateur/presentation/main/home_view.dart';
import 'package:installateur/presentation/splash/splash_view.dart';
import 'package:installateur/test.dart';

import 'presentation/box_details/box_details_view.dart';
import 'presentation/box_table/box_table_view.dart';

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
        home: BoxDetailsView());
  }
}
