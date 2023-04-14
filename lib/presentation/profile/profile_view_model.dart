import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:installateur/domain/model/user_model.dart';
import 'package:installateur/domain/repository/profile_repository.dart';

import '../../data/network/failure.dart';
import '../resources/colors_manager.dart';
import '../widgets_manager/show_snack_bar_widget.dart';

class ProfileViewModel extends GetxController {
  final ProfileRepository _profileRepository;
  ProfileViewModel(this._profileRepository);
  UserModel? profileModel;
  List<File> imageFile = [];
  bool PageLoading = false;

  @override
  void onInit() {
    super.onInit();
    handleGetUser();
  }

  Future<void> handleGetUser() async {
    PageLoading = true;
    update();

    UserModel user = await _profileRepository.getUserFromLocal();
    if (user != null) {
      profileModel = user;
      update();
      PageLoading = false;
      update();

      print(profileModel!.firstName.toString());
      print(profileModel!.email.toString());
    } else {
      profileModel = UserModel();
      update();
    }
  }

  Future<void> handlePickImageProfile(
      BuildContext context, ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      imageFile = [];
      imageFile.add(File(pickedFile.path));
      update();
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();

      print("susses: image picker");
    } else {
      print("error: image picker");
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  Future<void> handleUpdateProfile() async {
    if (imageFile != null) {
      Either<Failure, UserModel> profile = await _profileRepository
          .updateProfile(imageFile[0], profileModel!.id);
      if (profile.isRight()) {
        profile.fold(
            (l) => null,
            (r) => {
                  imageFile = [],
                  update(),
                  profileModel = r,
                  update(),
                  showSnackBarWidget("Profile Updated", ColorManager.mainColor,
                      title: "Success")
                });
      } else {
        profile.fold(
          (l) => showSnackBarWidget(l.message, ColorManager.error),
          (r) => r,
        );
      }
    }
  }
}
