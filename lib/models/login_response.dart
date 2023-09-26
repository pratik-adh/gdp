class LoginResponse {
  String? accessToken;
  String? refreshToken;

  LoginResponse({this.accessToken, this.refreshToken});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> loginData = <String, dynamic>{};
    loginData['access_token'] = accessToken;
    loginData['refresh_token'] = refreshToken;
    return loginData;
  }
}
