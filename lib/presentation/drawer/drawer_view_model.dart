import 'package:flutter/cupertino.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';

class DrawerViewModel {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Accueil",
      "icon": CupertinoIcons.house_fill,
      "route": RoutesManager.initial,
    },
    {
      "title": "Profile",
      "icon": CupertinoIcons.person_fill,
      "route": RoutesManager.profile,
    },
    {
      "title": "Réglage",
      "icon": CupertinoIcons.gear_alt_fill,
      "route": RoutesManager.setting,
    },
    {
      "title": "A propos",
      "icon": CupertinoIcons.info_circle_fill,
      "route": RoutesManager.loginScreen,
    },
  ];
}
