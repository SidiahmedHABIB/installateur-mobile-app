import 'package:installateur/domain/model/image_model.dart';

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? creatAt;
  String? updateAt;
  ImageModel? imageUser;

  UserModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.creatAt,
      this.updateAt,
      this.imageUser});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    creatAt = json['creatAt'];
    updateAt = json['updateAt'];
    imageUser = json['imageUser'] != null
        ? new ImageModel.fromJson(json['imageUser'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['creatAt'] = this.creatAt;
    data['updateAt'] = this.updateAt;
    if (this.imageUser != null) {
      data['imageUser'] = this.imageUser!.toJson();
    }
    return data;
  }
}
