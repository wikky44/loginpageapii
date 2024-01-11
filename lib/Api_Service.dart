import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:loginpageapi/Usermodel.dart';

class ApiServices{
  String endpoint = 'https://respos.menuclub.uk';
  Future<List<Usermodel>> getUsers() async {
    Response response = await http get(Uri.parse(endpoint));
    if (response.statusCode == 200){
      final List result = jsonDecode(response.body)['data'];
      return result.map(((e) => .fromJson(e))).toList();
    }else {
      throw Exception(response.reasonPhrase);
    }
  }
}