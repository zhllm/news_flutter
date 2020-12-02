import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/values/colors.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

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
            ExtendedNavigator.root.pop();
          },
        ),
    actions: actions,
  );
}

Widget cardListSkeleton() {
  return PKCardListSkeleton(
    isCircularImage: true,
    isBottomLinesActive: false,
    length: 10,
  );
}
