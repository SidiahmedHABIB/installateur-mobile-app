import 'package:installateur/domain/model/company_model.dart';
import 'report_model.dart';

class PageBox {
  List<BoxModel>? boxes;
  int? totalPages;

  PageBox({this.boxes, this.totalPages});

  PageBox.fromJson(Map<String, dynamic> json) {
    if (json['boxes'] != null) {
      boxes = <BoxModel>[];
      json['boxes'].forEach((v) {
        boxes!.add(new BoxModel.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.boxes != null) {
      data['boxes'] = this.boxes!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class BoxModel {
  int? id;
  String? status;
  String? name;
  String? entity;
  String? matricul;
  String? nserie;
  String? creatAt;
  String? updateAt;
  CompanyModel? companyBox;
  ReportModel? reportBox;

  BoxModel(
      {this.id,
      this.status,
      this.name,
      this.entity,
      this.matricul,
      this.nserie,
      this.creatAt,
      this.updateAt,
      this.companyBox,
      this.reportBox});

  BoxModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    name = json['name'];
    entity = json['entity'];
    matricul = json['matricul'];
    nserie = json['nserie'];
    creatAt = json['creatAt'];
    updateAt = json['updateAt'];
    companyBox = json['companyBox'] != null
        ? new CompanyModel.fromJson(json['companyBox'])
        : null;
    reportBox = json['reportBox'] != null
        ? new ReportModel.fromJson(json['reportBox'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['name'] = this.name;
    data['entity'] = this.entity;
    data['matricul'] = this.matricul;
    data['nserie'] = this.nserie;
    data['creatAt'] = this.creatAt;
    data['updateAt'] = this.updateAt;
    if (this.companyBox != null) {
      data['companyBox'] = this.companyBox!.toJson();
    }
    if (this.reportBox != null) {
      data['reportBox'] = this.reportBox!.toJson();
    }
    return data;
  }
}
