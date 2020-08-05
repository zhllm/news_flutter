import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/colors.dart';
import 'package:newsflutter/common/values/fonts.dart';
import 'package:newsflutter/common/widgets/widgets.dart';

Widget newsItem({
  Item item,
}) {
  return Container(
    height: setHeight(161),
    padding: EdgeInsets.all(setWidth(20)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: setWidth(121),
          child: imageCached(
            item.thumbnail,
            width: setWidth(121),
            height: setHeight(121),
          ),
        ),
        SizedBox(
          width: setWidth(194),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(0),
                child: Text(
                  item.author,
                  style: TextStyle(
                    fontFamily: CustomFont.Avenir,
                    fontWeight: FontWeight.normal,
                    color: AppColors.thirdElement,
                    fontSize: setFont(14),
                    height: 1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: setHeight(10)),
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontFamily: CustomFont.Montserrat,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryText,
                    fontSize: setFont(16),
                    height: 1,
                  ),
                  overflow: TextOverflow.clip,
                  maxLines: 3,
                ),
              ),
              Spacer(),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: setWidth(60),
                      ),
                      child: Text(
                        item.category,
                        style: TextStyle(
                          fontFamily: CustomFont.Avenir,
                          fontWeight: FontWeight.normal,
                          color: AppColors.secondaryElementText,
                          fontSize: setFont(14),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                    Container(
                      width: setWidth(15),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 120),
                      child: Text(
                        '·  ${dateFormat(item.addtime)}',
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
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
