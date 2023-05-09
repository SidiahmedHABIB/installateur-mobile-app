import 'package:installateur/domain/model/user_model.dart';

class LoginRequest {
  String? email;
  String? password;
  LoginRequest({
    this.email,
    this.password,
  });
  LoginRequest.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

class LoginResponse {
  String? status;
  UserModel? user;
  LoginResponse({
    this.status,
    this.user,
  });
  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}
