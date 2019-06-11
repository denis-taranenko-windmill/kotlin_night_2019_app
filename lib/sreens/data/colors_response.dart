class ResponseColor {
  String newColor;

  ResponseColor({this.newColor});

  ResponseColor.fromJson(Map<String, dynamic> json) {
    newColor = json['new_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['new_color'] = this.newColor;
    return data;
  }
}
