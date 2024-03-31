import 'package:flutter/material.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/widgets/common_widgets/text_fleid_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final appTheme = AppTheme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: appTheme.spaces.space_500,
            ),
            TextFieldWidget(
                hinttText: "55",
                prefixxIcon: Icon(Icons.abc),
                controller: emailController)
          ],
        ),
      ),
    );
  }
}
