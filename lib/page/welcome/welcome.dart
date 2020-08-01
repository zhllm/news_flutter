import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsflutter/common/utils/utils.dart';
import 'package:newsflutter/common/values/values.dart';

/// 创建时间：2020/8/1
/// 作者：zhangjie
/// 描述：

class Welcome extends StatefulWidget {
  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends State<Welcome> {
  Widget _buildPageHeaderTitle() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Text(
        'Features',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.primaryText,
          fontFamily: CustomFont.Montserrat,
          fontWeight: FontWeight.w600,
          fontSize: setFont(24),
        ),
      ),
    );
  }

  Widget _buildPageHeaderDetail() {
    return Container(
      width: setWidth(242),
      height: setHeight(70),
      margin: EdgeInsets.only(top: setHeight(14)),
      child: Text(
        'The best of news channels all in one place. Trusted sources and personalized news for you.',
        textAlign: TextAlign.center,
        style: TextStyle(
          // 文字颜色
          color: AppColors.primaryText,
          // 自定义文字字体
          fontFamily: CustomFont.Avenir,
          fontWeight: FontWeight.normal,
          fontSize: setFont(16),
          // 行高
          height: 1.3,
        ),
      ),
    );
  }

  Widget _buildPageFeatureItem(
      String imageName, double marginTop, String info) {
    return Container(
      width: setWidth(295),
      height: setHeight(80),
      margin: EdgeInsets.only(top: setHeight(marginTop)),
      child: Row(
        children: [
          Container(
            width: setWidth(80),
            height: setWidth(80),
            child: Image.asset(
              'assets/images/$imageName.png',
              fit: BoxFit.none,
            ),
          ),
          Spacer(),
          Container(
            width: setWidth(195),
            child: Text(
              info,
              textAlign: TextAlign.left,
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: CustomFont.Avenir,
                fontSize: setFont(16),
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return Container(
      width: setWidth(295),
      height: setHeight(44),
      margin: EdgeInsets.only(bottom: setHeight(20)),
      child: FlatButton(
        color: AppColors.primaryElement,
        textColor: AppColors.primaryElementText,
        child: Text(
          "Get Start",
        ),
        shape: RoundedRectangleBorder(
          borderRadius: Radii.k6pxRdius,
        ),
        onPressed: () {
          Navigator.pushNamed(
            context,
            "/sign-in",
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        width: 375, height: 812 - 44 - 34, allowFontScaling: true);
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          _buildPageHeaderTitle(),
          _buildPageHeaderDetail(),
          _buildPageFeatureItem('feature-1', 86,
              'Compelling photography and typography provide a beautiful reading'),
          _buildPageFeatureItem('feature-2', 40,
              'Sector news never shares your personal data with advertisers or publishers'),
          _buildPageFeatureItem('feature-3', 40,
              'You can get Premium to unlock hundreds of publications'),
          Spacer(),
          _buildStartButton(),
        ],
      ),
    ));
  }
}
