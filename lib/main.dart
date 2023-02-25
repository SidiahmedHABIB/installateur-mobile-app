import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/resources/routes_manager.dart';
import 'presentation/settings/settings_view.dart';

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
      // home: SettingsView(),
      getPages: RoutesManager.routes,
      initialRoute: RoutesManager.getInitial(),
    );
  }
}
