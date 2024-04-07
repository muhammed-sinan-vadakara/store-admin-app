import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/feactures/authentication/presentation/providers/auth_provider.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/dropdownbutton_widgets.dart';

class HomePage extends HookConsumerWidget {
  static const routePath = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: DropdownButtonWidget(), elevation: 12,
        //  Drawer(child: ,),
        //     IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     Icons.menu,
        //   ),
        // ),
        centerTitle: true,
        title: Text(
          "HOME",
        ),
        actions: [
          IconButton(
            onPressed: () =>
                ref.read(authenticationProvider.notifier).logout(context),
            icon: Icon(
              Icons.logout,
            ),
          )
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: AppTheme.of(context).colors.primary),
              borderRadius: BorderRadius.circular(32)),
          child: TextButton(
            onPressed: () =>
                ref.read(authenticationProvider.notifier).logout(context),
            child: Text(
              "LOGOUT",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.of(context).colors.text),
            ),
          ),
        ),
      ),
    );
  }
}
