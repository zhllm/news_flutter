import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/storage.dart';

import 'common/provider/app.dart';

class Global {
  static UserResponseEntity profile = UserResponseEntity(
    accessToken: null,
  );

  /// 第一次登陆
  static bool isFirstOpen = false;

  /// 离线登陆
  static bool isOfflineLogin = false;

  static bool get isRelease => bool.fromEnvironment("dart.env.product");

  static AppState appState = AppState();

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await StorageUtil.init();

    HttpUtil();

    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);


    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    /// 获取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_TOKEN_KEY);
    print(_profileJSON);
    if (_profileJSON != null) {
      profile = UserResponseEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
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
