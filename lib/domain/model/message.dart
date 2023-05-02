class Message {
  String? text;
  String? to;
  Message({required this.text, required this.to});

  Message.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['to'] = this.to;
    return data;
  }
}
