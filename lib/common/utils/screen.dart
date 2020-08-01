import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * ScreenUtil.pixelRatio 设备像素密度
 * ScreenUtil.screenWidth 设备宽
 * ScreenUtil.screenHeight 设备高
 * ScreenUtil.bottomBarHeight 底部tabBar高度
 * ScreenUtil.statusBarHeight 状态栏高度
 * ScreenUtil.textScaleFactor 字体缩放比
 */

/// 设置宽度
double setWidth(double width) {
  return ScreenUtil().setWidth(width);
}

/// 设置高度
double setHeight(double height) {
  return ScreenUtil().setWidth(height);
}

/// 设置字体
double setFont(double font) {
  return ScreenUtil().setSp(font);
}
