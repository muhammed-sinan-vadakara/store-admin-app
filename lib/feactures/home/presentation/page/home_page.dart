import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/feactures/authentication/presentation/providers/auth_provider.dart';

class HomePage extends HookConsumerWidget {
  static const routePath = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading:
            //  Drawer(child: ,),
            IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        ),
        title: Text(
          "HOME",
        ),
        actions: [
          Icon(
            Icons.abc,
          ),
        ],
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () =>
                  ref.read(authenticationProvider.notifier).logout(context),
              child: Text("log out"))
        ],
      ),
    );
  }
}
