import 'package:flutter/cupertino.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/utils.dart';

class UserApi {
  static Future<UserResponseEntity> login({
    @required BuildContext context,
    UserRequestEntity params,
  }) async {
    var response = await HttpUtil().post(
      '/user/login',
      params: params,
      context: context,
    );
    return UserResponseEntity.fromJson(response);
  }
}
