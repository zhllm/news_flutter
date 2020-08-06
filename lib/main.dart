import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:newsflutter/common/router/router.gr.dart';
import 'package:newsflutter/global.dart';
import 'package:provider/provider.dart';

import 'common/provider/provider.dart';

void main() {
  Global.init().then((value) => runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider<AppState>.value(
              value: Global.appState,
            ),
          ],

          /// 消费state一种通过provide.of，一种通过Consumer，
          /// 区别在于，Consumer的builder内局部刷新，
          /// provide.of 会刷新当前所处的build函数中的全部内容
          child: Consumer<AppState>(
            builder: (context, appState, _) {
              if (appState.isGrayFilter) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
                  child: MyApp(),
                );
              }
              return MyApp();
            },
          ),
        ),
      ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      builder: ExtendedNavigator<AppRouter>(
        initialRoute: Routes.indexPage,
        router: AppRouter(),
      ),
//      routes: staticRoutes,
//      home: IndexPage(),
    );
  }
}
