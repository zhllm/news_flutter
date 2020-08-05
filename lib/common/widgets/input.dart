import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/values/values.dart';

Widget input({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: setHeight(44),
    margin: EdgeInsets.only(top: setHeight(marginTop)),
    decoration: BoxDecoration(
        color: AppColors.primaryBackgroud,
        borderRadius: Radii.k6pxRdius,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(41, 0, 0, 0),
            offset: Offset(0, 1),
            blurRadius: 0,
          )
        ]),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
    ),
  );
}

Widget inputEmailEdit({
  double marginTop = 19,
  keyboardType = TextInputType.emailAddress,
  isPassword = false,
  @required TextEditingController controller,
  bool autoFocus = false,
  String hintText,
}) {
  return Container(
    height: setHeight(44),
    margin: EdgeInsets.only(top: setHeight(marginTop)),
    decoration: BoxDecoration(
      color: KColor.primaryBackground,
      borderRadius: Radii.k6pxRdius,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        )
      ],
    ),
    child: TextField(
      autocorrect: false,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: KColor.primaryText,
        ),
      ),
      style: TextStyle(
        color: KColor.primaryText,
        fontFamily: CustomFont.Avenir,
        fontWeight: FontWeight.w400,
        fontSize: setFont(18),
      ),
      maxLines: 1,
      autofocus: autoFocus,
      obscureText: isPassword,
    ),
  );
}
