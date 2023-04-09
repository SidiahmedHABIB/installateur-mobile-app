import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../resources/colors_manager.dart';
import '../resources/values_manager.dart';

class LoadingWidget extends StatelessWidget {
  double size;
  LoadingWidget({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SpinKitFadingCube(
      size: size,
      itemBuilder: (BuildContext context, int index) {
        return const DecoratedBox(
          decoration: BoxDecoration(
            color: ColorManager.mainColor,
          ),
        );
      },
    ));
  }
}
