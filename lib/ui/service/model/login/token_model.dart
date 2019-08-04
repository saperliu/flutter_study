
//{"access_token":"24e3e4b5-336f-4297-925c-03c81b446987","token_type":"bearer","refresh_token":"babd2cdc-127c-44d1-b30d-34b4a869c734","expires_in":2591999,"scope":"eccloud"}
class TokenModel {
  String accessToken;
  String tokenType;
  String refreshToken;
  int expiresIn;
  String scope;

  TokenModel.fromJson(Map<String, dynamic> json)
      : accessToken = json['access_token'],
        tokenType = json['token_type'],
        refreshToken = json['refresh_token'],
        expiresIn = json['expires_in'],
        scope = json['scope'];

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'token_type': tokenType,
    "refresh_token": refreshToken,
    "expires_in": expiresIn,
    "scope": scope,
  };
}

