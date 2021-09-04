
import 'package:drspace/model/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Connection{

final String baseUrl = "http://147.182.183.105/api";

  Future<AuthResponse> userAuth(String body) async {
    final http.Response response = await http.post(
        Uri.parse(baseUrl+"/admin/login") ,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept':'application/json'
      },
      body: body
    );
      return  AuthResponse.fromJson(json.decode(response.body));

    }






}