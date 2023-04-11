class ReportModel {
  int? id;
  String? name;
  String? type;
  String? reportData;
  String? creatAt;
  String? updateAt;

  ReportModel(
      {this.id,
      this.name,
      this.type,
      this.reportData,
      this.creatAt,
      this.updateAt});

  ReportModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    reportData = json['reportData'];
    creatAt = json['creatAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['reportData'] = this.reportData;
    data['creatAt'] = this.creatAt;
    data['updateAt'] = this.updateAt;
    return data;
  }
}
