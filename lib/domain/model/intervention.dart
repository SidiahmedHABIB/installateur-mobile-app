import 'package:installateur/domain/model/user_model.dart';

import 'company_model.dart';

class PageIntervention {
  List<InterventionModel>? interventions;
  int? totalPages;

  PageIntervention({this.interventions, this.totalPages});

  PageIntervention.fromJson(Map<String, dynamic> json) {
    if (json['interventions'] != null) {
      interventions = <InterventionModel>[];
      json['interventions'].forEach((v) {
        interventions!.add(new InterventionModel.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.interventions != null) {
      data['interventions'] =
          this.interventions!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class InterventionModel {
  int? id;
  String? comment;
  String? appointmentAt;
  String? status;
  String? creatAt;
  String? updateAt;
  UserModel? user;
  CompanyModel? company;

  InterventionModel(
      {this.id,
      this.comment,
      this.appointmentAt,
      this.status,
      this.creatAt,
      this.updateAt,
      this.user,
      this.company});

  InterventionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    appointmentAt = json['appointmentAt'];
    status = json['status'];
    creatAt = json['creatAt'];
    updateAt = json['updateAt'];
    user = json['user'] != null ? new UserModel.fromJson(json['user']) : null;
    company = json['company'] != null
        ? new CompanyModel.fromJson(json['company'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['appointmentAt'] = this.appointmentAt;
    data['status'] = this.status;
    data['creatAt'] = this.creatAt;
    data['updateAt'] = this.updateAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}
