import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/values/values.dart';

Widget flatButtonWidget({
  @required VoidCallback onPressed,
  String title = 'button',
  double width = 140,
  double height = 44,
  Color bgColor = AppColors.primaryElement,
  Color fontColor = AppColors.primaryElementText,
  double fontSize = 18,
  String fontName = CustomFont.Montserrat,
  FontWeight fontWeight = FontWeight.w400,
}) {
  return Container(
    width: setWidth(width),
    height: setHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      color: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k6pxRdius,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: setFont(fontSize),
          height: 1,
        ),
      ),
    ),
  );
}

Widget flatButtonBorderOnlyWidget({
  @required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  String iconFileName,
}) {
  return Container(
    width: setWidth(width),
    height: setHeight(height),
    child: FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: Borders.primaryBorder,
        borderRadius: Radii.k6pxRdius,
      ),
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}
