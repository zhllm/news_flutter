import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/values/colors.dart';
import 'package:newsflutter/common/values/fonts.dart';
import 'package:newsflutter/common/widgets/button.dart';
import 'package:newsflutter/common/widgets/input.dart';

Widget letterSubscribe() {
  return Container(
    margin: EdgeInsets.all(setWidth(20)),
    child: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Newsletter',
              style: TextStyle(
                fontFamily: CustomFont.Montserrat,
                fontSize: setFont(18),
                fontWeight: FontWeight.w600,
                color: KColor.thirdElementText,
              ),
            ),
            Spacer(),
            IconButton(
              icon: Icon(
                Icons.close,
                color: KColor.thirdElementText,
                size: setFont(17.0),
              ),
              onPressed: () {},
            )
          ],
        ),
        inputEmailEdit(
          controller: null,
          hintText: 'Email',
          isPassword: false,
          keyboardType: TextInputType.emailAddress,
          marginTop: 19,
        ),
        Padding(
          padding: EdgeInsets.only(top: setHeight(15)),
          child: flatButtonWidget(
            onPressed: () {},
            width: setWidth(335),
            height: setHeight(44),
            fontWeight: FontWeight.w600,
            title: 'Subscribe',
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: setHeight(29)),
          width: setWidth(261),
          child: Text(
            'By clicking on Subscribe button you agree to accept Privacy Policy',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: KColor.tabBarElement,
              fontFamily: CustomFont.Avenir,
              fontSize: setFont(14),
              fontWeight: FontWeight.normal,
              height: 1,
            ),
            maxLines: 2,
          ),
        )
      ],
    ),
  );
}
