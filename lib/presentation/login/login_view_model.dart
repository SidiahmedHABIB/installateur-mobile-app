import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:installateur/domain/repository/auth_repository.dart';
import 'package:installateur/presentation/resources/routes_manager.dart';
import '../../data/network/failure.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class LoginViewModel extends GetxController {
  final AuthRepository authRepository;
  bool loading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginViewModel(this.authRepository);

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty) {
      showSnackBarWidget("Type in your email adress", ColorManager.error,
          title: "Email Adress");
    } else if (!GetUtils.isEmail(email)) {
      showSnackBarWidget("Type in a valid email adress", ColorManager.error,
          title: "Email Adress");
    } else if (password.isEmpty) {
      showSnackBarWidget("Type in your password", ColorManager.error,
          title: "Password");
    } else if (password.length < 6) {
      showSnackBarWidget("Password can not be less then 6", ColorManager.error,
          title: "Password");
    } else {
      loading = true;
      update();
      Either<Failure, bool> login = await authRepository.login(email, password);
      if (login.isRight()) {
        Timer(Duration(seconds: 2), () {
          Get.offNamed(RoutesManager.getInitial());
        });
      } else {
        login.fold(
          (l) => showSnackBarWidget(l.message, ColorManager.error),
          (r) => r,
        );
        loading = false;
        update();
      }
    }
  }
}
