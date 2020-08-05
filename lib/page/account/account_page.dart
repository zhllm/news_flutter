import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/provider/provider.dart';
import 'package:newsflutter/common/utils/authentication.dart';
import 'package:newsflutter/global.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Container(
      child: Column(
        children: [
          Text('Account Page ${Global.profile?.displayName}'),
          MaterialButton(
            onPressed: () {
              getLoginPage(context);
            },
            child: Text('退出'),
          ),
          Divider(
            height: 1,
          ),
          MaterialButton(
            onPressed: () {
              appState.switchGrayFilter();
            },
            child: Text('灰色切换 ${appState.isGrayFilter}'),
          )
        ],
      ),
    );
  }
}
