import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/screen.dart';
import 'package:newsflutter/common/values/colors.dart';
import 'package:newsflutter/common/values/values.dart';

Widget newsChannelWidget({
  List<ChannelResponseEntity> lists,
  Function(ChannelResponseEntity) onTap
}) {
  return Container(
    height: setHeight(137),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: lists.map<Widget>((e) {
          return Container(
            width: setWidth(70),
            height: setHeight(97),
            margin: EdgeInsets.symmetric(horizontal: setWidth(10)),
            child: InkWell(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: setWidth(64),
                    margin: EdgeInsets.symmetric(horizontal: setWidth(3)),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          child: Container(
                            height: 64,
                            decoration: BoxDecoration(
                              color: AppColors.primaryBackgroud,
                              boxShadow: [
                                Shadows.primaryShadow,
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32)),
                            ),
                            child: Container(),
                          ),
                        ),
                        Positioned(
                          left: setWidth(10),
                          top: setWidth(10),
                          right: setWidth(10),
                          child:
                              Image.asset("assets/images/channel-${e.code}.png"),
                        )
                      ],
                    ),
                  ),
                  Text(
                    e.title,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: TextStyle(
                      color: AppColors.thirdElement,
                      fontFamily: CustomFont.Avenir,
                      fontWeight: FontWeight.w400,
                      fontSize: setFont(14),
                      height: 1,
                    ),
                  )
                ],
              ),
              onTap: () => onTap(e),
            ),
          );
        }).toList(),
      ),
    ),
  );
}
