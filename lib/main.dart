import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:store_admin_app/core/theme/theme_provider.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/login_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'STORE-ADMIN-APP',
      theme: ref.watch(themeProvider),
      home: const LoginPage(),
    );
  }
}
