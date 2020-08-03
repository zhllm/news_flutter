import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/storage.dart';

class Global {
  static UserResponseEntity profile = UserResponseEntity(
    accessToken: null,
  );

  static bool get isRelease => bool.fromEnvironment("dart.env.product");

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await StorageUtil.init();
    HttpUtil();

    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_TOKEN_KEY);
    if (_profileJSON != null) {
      profile = UserResponseEntity.fromJson(_profileJSON);
    }

    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static Future<bool> saveProfile(UserResponseEntity userResponse) {
    profile = userResponse;
    return StorageUtil().setJSON(STORAGE_USER_TOKEN_KEY, userResponse.toJson());
  }
}
