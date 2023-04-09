import 'dart:io';
import '../../domain/model/user_model.dart';

class ProfileRequest {
  UserModel? user;
  File? file;
  ProfileRequest({this.user, this.file});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['ImageData'] = this.user!.toJson();
    }
    data['file'] = this.file;

    return data;
  }
}
