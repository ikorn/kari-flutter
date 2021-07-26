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
