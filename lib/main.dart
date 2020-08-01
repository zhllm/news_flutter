import 'package:flutter/material.dart';
import 'package:newsflutter/page/welcome/welcome.dart';
import 'package:newsflutter/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      routes: staticRoutes,
      home: Welcome(),
    );
  }
}
