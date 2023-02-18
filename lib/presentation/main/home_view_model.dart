import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  static List<Map<String, dynamic>> menus = [
    {
      "title": "Accueil",
      "icon": CupertinoIcons.house_fill,
      "route": "/counter",
    },
    {
      "title": "Profile",
      "icon": CupertinoIcons.person_fill,
      "route": "/users",
    },
    {
      "title": "Réglage",
      "icon": CupertinoIcons.gear_alt_fill,
      "route": "/meteo",
    },
    {
      "title": "A propos",
      "icon": CupertinoIcons.info_circle_fill,
      "route": "/gallery",
    },
  ];
}
