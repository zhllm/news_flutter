// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:newsflutter/common/entity/news.dart';
import 'package:newsflutter/page/index/index.dart';
import 'package:newsflutter/page/welcome/welcome.dart';
import 'package:newsflutter/page/sign_in/sign_in.dart';
import 'package:newsflutter/page/sign_up/sign_up.dart';
import 'package:newsflutter/page/application/application.dart';
import 'package:newsflutter/page/detail/detail_page.dart';
import 'package:newsflutter/common/router/router.dart';
import 'package:newsflutter/common/router/auth_guard.dart';

class Routes {
  static const String indexPage = '/';
  static const String welcome = '/Welcome';
  static const String signInPage = '/sign-in-page';
  static const String signUpPage = '/sign-up-page';
  static const String application = '/Application';
  static const String detailPage = '/detail-page';
  static const all = <String>{
    indexPage,
    welcome,
    signInPage,
    signUpPage,
    application,
    detailPage,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.indexPage, page: IndexPage),
    RouteDef(Routes.welcome, page: Welcome),
    RouteDef(Routes.signInPage, page: SignInPage),
    RouteDef(Routes.signUpPage, page: SignUpPage),
    RouteDef(Routes.application, page: Application),
    RouteDef(Routes.detailPage, page: DetailPage, guards: [AuthGuard]),
  ];

  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    IndexPage: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => IndexPage(),
        settings: data,
      );
    },
    Welcome: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Welcome(),
        settings: data,
      );
    },
    SignInPage: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInPage(),
        settings: data,
      );
    },
    SignUpPage: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpPage(),
        settings: data,
      );
    },
    Application: (RouteData data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Application(),
        settings: data,
      );
    },
    DetailPage: (RouteData data) {
      var args = data.getArgs<DetailPageArguments>(
          orElse: () => DetailPageArguments());
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => DetailPage(
          key: args.key,
          item: args.item,
        ),
        settings: data,
        transitionsBuilder: zoomInTransition,
      );
    },
  };
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension AppRouterNavigationHelperMethods on ExtendedNavigatorState {
  Future<dynamic> pushIndexPage() => pushNamed<dynamic>(Routes.indexPage);

  Future<dynamic> pushWelcome() => pushNamed<dynamic>(Routes.welcome);

  Future<dynamic> pushSignInPage() => pushNamed<dynamic>(Routes.signInPage);

  Future<dynamic> pushSignUpPage() => pushNamed<dynamic>(Routes.signUpPage);

  Future<dynamic> pushApplication() => pushNamed<dynamic>(Routes.application);

  Future<dynamic> pushDetailPage(
          {Key key, NewsRecommendResponseEntity item, OnNavigationRejected onReject}) =>
      pushNamed<dynamic>(
        Routes.detailPage,
        arguments: DetailPageArguments(key: key, item: item),
        onReject: onReject,
      );
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//DetailPage arguments holder class
class DetailPageArguments {
  final Key key;
  final NewsRecommendResponseEntity item;

  DetailPageArguments({this.key, this.item});
}
