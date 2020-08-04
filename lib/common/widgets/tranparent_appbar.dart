import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/values/colors.dart';

Widget transparentAppBar({
  BuildContext context,
  List<Widget> actions,
  Widget title,
  Widget leading,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title ?? Text(''),
    leading: leading ??
        IconButton(
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
