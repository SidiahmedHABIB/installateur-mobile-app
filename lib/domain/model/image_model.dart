class ImageModel {
  int? id;
  String? name;
  String? type;
  String? imageData;
  String? creatAt;
  String? updateAt;

  ImageModel(
      {this.id,
      this.name,
      this.type,
      this.imageData,
      this.creatAt,
      this.updateAt});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    imageData = json['imageData'];
    creatAt = json['creatAt'];
    updateAt = json['updateAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['imageData'] = this.imageData;
    data['creatAt'] = this.creatAt;
    data['updateAt'] = this.updateAt;
    return data;
  }
}
