import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/fonts.dart';
import 'package:newsflutter/common/values/values.dart';
import 'package:newsflutter/common/widgets/widgets.dart';

Widget recommendWidget({
  NewsRecommendResponseEntity responseEntity,
}) {
  return Container(
    margin: EdgeInsets.all(setWidth(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageCached(
          responseEntity.thumbnail,
          width: setWidth(335),
          height: setHeight(290),
        ),
        Container(
          margin: EdgeInsets.only(top: setHeight(14)),
          child: Text(
            responseEntity.author,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: CustomFont.Montserrat,
              fontSize: setFont(14),
              color: AppColors.thirdElement,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: setHeight(10)),
          child: Text(
            responseEntity.title,
            style: TextStyle(
              fontFamily: CustomFont.Montserrat,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryText,
              fontSize: setFont(24),
              height: 1,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: setHeight(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: Text(
                  responseEntity.category,
                  style: TextStyle(
                    fontFamily: CustomFont.Avenir,
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryElementText,
                    fontSize: setFont(14),
                    height: 1,
                  ),
                ),
              ),
              Container(
                width: setWidth(15),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 120),
                child: Text(
                  '·  ${dateFormat(responseEntity.addtime)}',
                  style: TextStyle(
                    fontFamily: CustomFont.Avenir,
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElement,
                    fontSize: setFont(14),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                ),
              ),
              Spacer(),
              InkWell(
                child: Icon(
                  Icons.more_horiz,
                  color: AppColors.primaryText,
                  size: 24,
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
