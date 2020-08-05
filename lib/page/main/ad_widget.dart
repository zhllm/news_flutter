import 'package:flutter/cupertino.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/values.dart';

Widget adWidget() {
  return Container(
    alignment: Alignment.center,
    height: setHeight(100),
    padding: EdgeInsets.all(setWidth(20)),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: setWidth(20)),
      decoration: BoxDecoration(
        borderRadius: Radii.k6pxRdius,
        border: Border.fromBorderSide(Borders.primaryBorder),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tired of Ads? Get Premium - \$9.99',
            style: TextStyle(
              fontFamily: CustomFont.Avenir,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryText,
              fontSize: setFont(18),
            ),
          )
        ],
      ),
    ),
  );
}
