import 'package:flutter/cupertino.dart';

class UserRequestEntity {
  final String account;
  final String secret;

  UserRequestEntity({
    @required this.account,
    @required this.secret,
  });

  factory UserRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserRequestEntity(
        account: json['account'],
        secret: json['secret'],
      );

  Map<String, dynamic> toJson() => ({
        "account": account,
        "secret": secret,
      });
}

class UserResponseEntity {
  String accessToken;
  String displayName;
  List<String> channels;

  UserResponseEntity({
    @required this.accessToken,
    this.displayName,
    this.channels,
  });

  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserResponseEntity(
        accessToken: json['access_token'],
        displayName: json['display_name'],
        channels: List<String>.from(json['channels'].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": this.accessToken,
        "displayName": this.displayName,
        "channels": List<dynamic>.from(this.channels.map((e) => e)),
      };

  @override
  String toString() {
    return 'UserResponseEntity{accessToken: $accessToken, displayName: $displayName, channels: $channels}';
  }
}
