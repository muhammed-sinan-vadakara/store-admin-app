import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/auth_switcher.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/login_page.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/sign_up_page.dart';
import 'package:store_admin_app/feactures/home/presentation/page/home_page.dart';
import 'package:store_admin_app/main.dart';

part 'router.g.dart';

final router = GoRouter(
  navigatorKey: MyApp.navigatorKey,
  initialLocation: AuthSwitcher.routePath,
  routes: [
    GoRoute(
      path: AuthSwitcher.routePath,
      builder: (context, state) => const AuthSwitcher(),
    ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: SignupPage.routePath,
      builder: (context, state) => const SignupPage(),
    ),
  ],
);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}