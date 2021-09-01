class UserModel {
  int? id;
  String? fullName;

  UserModel({this.id, this.fullName});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    return data;
  }
}
