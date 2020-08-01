import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:newsflutter/common/utils/screen.dart';

Future<bool> toastInfo({
  String msg,
  Color bgColor,
  Color textColor,
}) async {
  return await Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.TOP,
    timeInSecForIos: 1,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: setFont(16),
  );
}
