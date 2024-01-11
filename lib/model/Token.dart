import 'dart:convert';

Token tokenFromJson(String str) => Token.fromJson(json.decode(str));
String tokenToJson(Token data) => json.encode(data.toJson());
class Token {
  Token({
      this.refresh, 
      this.access,});

  Token.fromJson(dynamic json) {
    refresh = json['refresh'];
    access = json['access'];
  }
  String? refresh;
  String? access;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['refresh'] = refresh;
    map['access'] = access;
    return map;
  }

}