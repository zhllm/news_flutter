import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/entity/entity.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/colors.dart';
import 'package:newsflutter/common/values/fonts.dart';

Widget categoriesWidget({
  List<CategoryResponseEntity> categories,
  String selectedCode,
  Function(CategoryResponseEntity) onTap,
}) {
  return categories == null
      ? Container()
      : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map<Widget>((e) {
              return Container(
                alignment: Alignment.center,
                height: setHeight(52),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  child: Text(
                    e.title,
                    style: TextStyle(
                      color: selectedCode == e.code
                          ? AppColors.secondaryElementText
                          : AppColors.primaryText,
                      fontSize: setFont(18),
                      fontFamily: CustomFont.Montserrat,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    onTap(e);
                  },
                ),
              );
            }).toList(),
          ),
        );
}
