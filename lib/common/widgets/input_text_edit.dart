import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/values.dart';

Widget inputTextEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
}) {
  return Container(
    height: setHeight(44),
    margin: EdgeInsets.only(top: marginTop),
    decoration: BoxDecoration(
      color: AppColors.secondaryElement,
      borderRadius: Radii.k6pxRdius,
    ),
    child: TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
      ),
      style: TextStyle(
        color: AppColors.primaryText,
        fontFamily: CustomFont.Avenir,
        fontWeight: FontWeight.w400,
        fontSize: setFont(18),
      ),
      maxLines: 1,
      // 自动纠正
      autocorrect: false,
      // 隐藏输入内容，加密
      obscureText: isPassword,
    ),
  );
}
