import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:newsflutter/common/widgets/toast.dart';
import 'package:newsflutter/global.dart';
import 'package:newsflutter/page/application/application.dart';
import 'package:newsflutter/page/sign_in/sign_in.dart';
import 'package:newsflutter/page/welcome/welcome.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      width: 375,
      height: 812 - 44 - 34,
      allowFontScaling: true,
    );
    toastInfo(msg: '${Global.isOfflineLogin}');
    return Scaffold(
      body: Global.isFirstOpen == true
          ? Welcome()
          : Global.isOfflineLogin == true ? Application() : SignInPage(),
    );
  }
}
