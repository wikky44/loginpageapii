import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));
String userDataToJson(UserData data) => json.encode(data.toJson());
class UserData {
  UserData({
      this.id, 
      this.username, 
      this.email, 
      this.waiter,});

  UserData.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    waiter = json['waiter'];
  }
  num? id;
  String? username;
  String? email;
  bool? waiter;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['email'] = email;
    map['waiter'] = waiter;
    return map;
  }

}