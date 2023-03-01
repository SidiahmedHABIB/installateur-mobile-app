import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import 'package:installateur/presentation/resources/strings_manager.dart';

class DrawerViewModel {
  static List<Map<String, dynamic>> menus = [
    {
      "title": StringsManager.drawerTile1.tr,
      "icon": CupertinoIcons.house_fill,
      "route": RoutesManager.initial,
    },
    {
      "title": StringsManager.drawerTile2.tr,
      "icon": CupertinoIcons.person_fill,
      "route": RoutesManager.profile,
    },
    {
      "title": StringsManager.drawerTile3.tr,
      "icon": CupertinoIcons.gear_alt_fill,
      "route": RoutesManager.setting,
    },
    {
      "title": StringsManager.drawerTile4.tr,
      "icon": CupertinoIcons.info_circle_fill,
      "route": RoutesManager.boxTable,
    },
  ];
}
