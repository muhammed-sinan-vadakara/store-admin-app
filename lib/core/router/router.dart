import 'package:go_router/go_router.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/auth_switcher.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/login_page.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/profile_page.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/sign_up_page.dart';
import 'package:store_admin_app/feactures/home/domain/entity/coustemer_entity.dart';
import 'package:store_admin_app/feactures/home/domain/entity/product_entity.dart';
import 'package:store_admin_app/feactures/home/presentation/page/cotomer_edit_page.dart';
import 'package:store_admin_app/feactures/home/presentation/page/coustomer_adding_page.dart';
import 'package:store_admin_app/feactures/home/presentation/page/customer_details_page.dart';
import 'package:store_admin_app/feactures/home/presentation/page/home_page.dart';
import 'package:store_admin_app/feactures/home/presentation/page/product_adding_page.dart';
import 'package:store_admin_app/feactures/home/presentation/page/product_details_page.dart';
import 'package:store_admin_app/feactures/home/presentation/page/product_edit_page.dart';
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
    GoRoute(
      path: ProfilePage.routePath,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: CustomerDetailsPage.routePath,
      builder: (context, state) => const CustomerDetailsPage(),
    ),
    GoRoute(
      path: CustomerAddingPage.routePath,
      builder: (context, state) => const CustomerAddingPage(),
    ),
    GoRoute(
      path: ProductAddingPage.routePath,
      builder: (context, state) => const ProductAddingPage(),
    ),
    GoRoute(
      path: ProductDetailsPage.routePath,
      builder: (context, state) => const ProductDetailsPage(),
    ),
    GoRoute(
      path: CostomerEditPage.routePath,
      builder: (context, state) =>
          CostomerEditPage(entity: state.extra as CoustomerEntity),
    ),
    GoRoute(
      path: ProductEditPage.routePath,
      builder: (context, state) =>
          ProductEditPage(entity: state.extra as ProductEntity),
    ),
  ],
);

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  return router;
}
