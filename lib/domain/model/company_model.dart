import 'package:installateur/domain/model/image_model.dart';

class CompanyModel {
  int? id;
  String? name;
  String? location;
  String? phone;
  String? email;
  String? creatAt;
  String? updateAt;
  ImageModel? imageCompany;

  CompanyModel(
      {this.id,
      this.name,
      this.location,
      this.phone,
      this.email,
      this.creatAt,
      this.updateAt,
      this.imageCompany});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    phone = json['phone'];
    email = json['email'];
    creatAt = json['creatAt'];
    updateAt = json['updateAt'];
    imageCompany = json['imageCompany'] != null
        ? new ImageModel.fromJson(json['imageCompany'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['creatAt'] = this.creatAt;
    data['updateAt'] = this.updateAt;
    if (this.imageCompany != null) {
      data['imageCompany'] = this.imageCompany!.toJson();
    }
    return data;
  }
}
