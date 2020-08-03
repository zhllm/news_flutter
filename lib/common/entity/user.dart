import 'package:flutter/cupertino.dart';

class UserRequestEntity {
  final String email;
  final String password;

  UserRequestEntity({
    @required this.email,
    @required this.password,
  });

  factory UserRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserRequestEntity(
        email: json['email'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => ({
        "email": email,
        "password": password,
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
        accessToken: json['accessToken'],
        displayName: json['displayName'],
        channels: json['channels'],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": this.accessToken,
        "displayName": this.displayName,
        "channels": this.channels,
      };
}
