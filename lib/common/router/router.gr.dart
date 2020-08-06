// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:newsflutter/page/index/index.dart';
import 'package:newsflutter/page/welcome/welcome.dart';
import 'package:newsflutter/page/sign_in/sign_in.dart';
import 'package:newsflutter/page/sign_up/sign_up.dart';
import 'package:newsflutter/page/application/application.dart';
import 'package:newsflutter/page/detail/detail_page.dart';

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
    RouteDef(Routes.detailPage, page: DetailPage),
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
      return MaterialPageRoute<dynamic>(
        builder: (context) => DetailPage(
          key: args.key,
          title: args.title,
          url: args.url,
        ),
        settings: data,
      );
    },
  };
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//DetailPage arguments holder class
class DetailPageArguments {
  final Key key;
  final String title;
  final String url;
  DetailPageArguments({this.key, this.title, this.url});
}
