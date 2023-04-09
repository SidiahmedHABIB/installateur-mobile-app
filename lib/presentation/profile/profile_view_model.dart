import 'dart:io';
import 'package:dartz/dartz.dart';
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

  @override
  void onInit() {
    super.onInit();
    handleGetUser();
  }

  Future<void> handleGetUser() async {
    UserModel user = await _profileRepository.getUserFromLocal();
    if (user != null) {
      profileModel = user;
      update();
      print(profileModel!.firstName.toString());
      print(profileModel!.email.toString());
    } else {
      profileModel = UserModel();
      update();
    }
  }

  // Future<void> pickImage(ImageSource source) async {
  //   final pickedFile = await ImagePicker().pickImage(source: source);
  //   if (pickedFile != null) {
  //     imageFile = File(pickedFile.path);
  //     update();
  //     print("susses: image picker");
  //   } else {
  //     print("error: image picker");
  //     update();
  //   }
  // }

  Future<void> editProfile(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      File? imageFile = File(pickedFile.path);
      update();
      print("susses: image picker");
      Either<Failure, UserModel> profile =
          await _profileRepository.updateProfile(imageFile);
      if (profile.isRight()) {
        profile.fold(
            (l) => null,
            (r) => {
                  profileModel = r,
                  update(),
                });
      } else {
        profile.fold(
          (l) => showSnackBarWidget(l.message, ColorManager.error),
          (r) => r,
        );
      }
    } else {
      print("error: image picker");
    }
  }
}
