import 'package:newsflutter/page/application/application.dart';
import 'package:newsflutter/page/sign_in/sign_in.dart';
import 'package:newsflutter/page/sign_up/sign_up.dart';

var staticRoutes = {
  "/sign-in": (context) => SignInPage(),
  "/sign-up": (context) => SignUpPage(),
  "/application": (context) => Application(),
};
