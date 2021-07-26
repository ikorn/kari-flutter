import 'dart:convert';

import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:http/http.dart' as http;

class Api {
  static String baseUrl =
      "https://fe8dfbd7-de3a-478f-b302-4a64475cccf8.mock.pstmn.io/";

  String? accessToken;
  String? refreshToken;

  Api() {
    Future.wait([
      FlutterKeychain.get(key: "access_token"),
      FlutterKeychain.get(key: "refresh_token")
    ]).then((value) {
      this.accessToken = value[0];
      this.refreshToken = value[1];
    });
  }

  void saveToken(AuthToken token) {
    this.accessToken = token.accessToken;
    this.refreshToken = token.refreshToken;
    FlutterKeychain.put(key: "access_token", value: token.accessToken);
    FlutterKeychain.put(key: "refresh_token", value: token.refreshToken);
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

  Future<http.Response> login(String email, String password) async {
    return await http.post(
        _getUrl("login"),
        headers: _getHeaders(),
        body: jsonEncode({'email': email, 'password': password }));
  }

  void logout() async {
    var response = await http.delete(_getUrl("logout"), headers: _getHeaders());
    if (response.statusCode != 200) {
      throw Exception("failed");
    }
  }
}

class AuthToken {
  final String accessToken;
  final String refreshToken;

  AuthToken({required this.accessToken, required this.refreshToken});

  factory AuthToken.fromJson(Map<String, dynamic> json) {
    var accessToken = json['access_token'];
    var refreshToken = json['refresh_token'];
    if (accessToken == null || refreshToken == null) {
      throw Exception("Parse Error");
    }
    return AuthToken(accessToken: accessToken, refreshToken: refreshToken);
  }
}
