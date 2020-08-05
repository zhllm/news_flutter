import 'package:flutter/cupertino.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/storage.dart';
import 'package:newsflutter/global.dart';

Future<bool> isAuthenticated() async {
  var profileJSON = await StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = null;
}

Future getLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Navigator.pushNamedAndRemoveUntil(
      context, "/sign-in", (Route<dynamic> route) => true);
}
