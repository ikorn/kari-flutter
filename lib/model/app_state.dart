import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter_keychain/flutter_keychain.dart';
import 'package:karikore/model/entity/app_token.dart';

import 'entity/user.dart';

class AppState extends foundation.ChangeNotifier {
  // fields.
  AuthToken? _authToken;
  User? consumer;

  AppState() {
    Future.wait([
      FlutterKeychain.get(key: "access_token"),
      FlutterKeychain.get(key: "refresh_token")
    ]).then((value) {
      var accessToken = value[0];
      var refreshToken = value[1];
      if (accessToken != null && refreshToken != null) {
        AuthToken token =
            AuthToken(accessToken: accessToken, refreshToken: refreshToken);
        saveToken(token);
        notifyListeners();
      }
    });
  }

  // getters.
  String? getAccessToken() {
    return this._authToken?.accessToken;
  }

  String? getRefreshToken() {
    return this._authToken?.refreshToken;
  }

  // setters.
  void saveToken(AuthToken token) => Future.wait([
        FlutterKeychain.put(key: "access_token", value: token.accessToken),
        FlutterKeychain.put(key: "refresh_token", value: token.refreshToken)
      ]).then((value) {
        _authToken = token;
        notifyListeners();
      });

  void clearTokens() => FlutterKeychain.clear().then((value) {
        _authToken = null;
        notifyListeners();
      });
}
