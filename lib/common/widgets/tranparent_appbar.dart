import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/values/colors.dart';

Widget transparentAppBar({
  BuildContext context,
  List<Widget> actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(''),
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.primaryText,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    actions: actions,
  );
}
