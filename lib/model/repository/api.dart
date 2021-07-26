import 'dart:convert';

import 'package:http/http.dart' as http;

import '../entity/app_token.dart';

class Api {
  static String baseUrl =
      "https://fe8dfbd7-de3a-478f-b302-4a64475cccf8.mock.pstmn.io/";

  String? accessToken;
  String? refreshToken;

  void setToken(String? accessToken, String? refreshToken) {
    this.accessToken = accessToken;
    this.refreshToken = refreshToken;
  }

  Uri _getUrl(String path) {
    return Uri.parse(baseUrl + path);
  }

  Map<String, String> _getHeaders() {
    Map<String, String> map = Map();
    map['Content-Type'] = 'application/json';
    if (this.accessToken != null) {
      map['Authorization'] = 'Bearer ${this.accessToken}';
    }
    return map;
  }

  Future<AuthToken> login(String email, String password) async {
    var response = await http.post(
        _getUrl("login"),
        headers: _getHeaders(),
        body: jsonEncode({'email': email, 'password': password }));
    if (response.statusCode != 200) {
      throw Exception("Failed");
    }
    return AuthToken.fromJson(jsonDecode(response.body));
  }

  Future<bool> logout() async {
    var response = await http.delete(_getUrl("logout"), headers: _getHeaders());
    return response.statusCode == 200;
  }
}