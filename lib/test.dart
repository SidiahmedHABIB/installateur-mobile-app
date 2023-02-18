import 'package:flutter/material.dart';
import 'package:installateur/presentation/resources/colors_manager.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body: Container(child: const Text("data")),
    );
  }
}
