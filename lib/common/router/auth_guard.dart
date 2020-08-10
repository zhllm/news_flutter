import 'package:auto_route/auto_route.dart';
import 'package:newsflutter/common/router/router.gr.dart';
import 'package:newsflutter/common/utils/utils.dart';

class AuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(
    ExtendedNavigatorState<RouterBase> navigator,
    String routeName,
    Object arguments,
  ) async {
    var isAuth = await isAuthenticated();
    if (isAuth == false) {
      ExtendedNavigator.root.pushNamed(Routes.signInPage);
    }
    return isAuth;
  }
}
