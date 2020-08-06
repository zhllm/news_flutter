import 'package:auto_route/auto_route_annotations.dart';
import 'package:newsflutter/page/application/application.dart';
import 'package:newsflutter/page/detail/detail_page.dart';
import 'package:newsflutter/page/index/index.dart';
import 'package:newsflutter/page/sign_in/sign_in.dart';
import 'package:newsflutter/page/sign_up/sign_up.dart';
import 'package:newsflutter/page/welcome/welcome.dart';

/**
 * generateNavigationHelperExtension: true,
    routes
 */

@MaterialAutoRouter(routes: [
  MaterialRoute(page: IndexPage, initial: true),
  MaterialRoute(page: Welcome),
  MaterialRoute(page: SignInPage),
  MaterialRoute(page: SignUpPage),
  MaterialRoute(page: Application),
  MaterialRoute(page: DetailPage),
])
class $AppRouter {
  DetailPage detailPage;
}
