class PageNotice {
  List<NoticeModel>? notices;
  int? totalPages;

  PageNotice({this.notices, this.totalPages});

  PageNotice.fromJson(Map<String, dynamic> json) {
    if (json['notices'] != null) {
      notices = <NoticeModel>[];
      json['notices'].forEach((v) {
        notices!.add(new NoticeModel.fromJson(v));
      });
    }
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notices != null) {
      data['notices'] = this.notices!.map((v) => v.toJson()).toList();
    }
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class NoticeModel {
  int? id;
  String? name;
  String? type;
  String? noticeData;
  String? creatAt;
  String? updateAt;

  NoticeModel(
      {this.id,
      this.name,
      this.type,
      this.noticeData,
      this.creatAt,
      this.updateAt});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    noticeData = json['noticeData'];
    creatAt = json['creatAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['noticeData'] = this.noticeData;
    data['creatAt'] = this.creatAt;
    data['updateAt'] = this.updateAt;
    return data;
  }
}
