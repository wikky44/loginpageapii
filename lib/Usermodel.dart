import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));
String usermodelToJson(Usermodel data) => json.encode(data.toJson());
class Usermodel {
  Usermodel({
      this.id, 
      this.username, 
      this.email, 
      this.waiter,});

  Usermodel.fromJson(dynamic json) {
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