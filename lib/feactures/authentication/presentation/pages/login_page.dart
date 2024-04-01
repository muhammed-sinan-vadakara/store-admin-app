import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:store_admin_app/core/widgets/common_widgets/text_fleid_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/sign_up_page.dart';
import 'package:store_admin_app/feactures/authentication/presentation/providers/auth_provider.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final appTheme = AppTheme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                    height: 150,
                    width: 300,
                    child: Lottie.asset("assets/animations/signuppage.json",
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: appTheme.spaces.space_500,
              ),
              TextFieldWidget(
                  hinttText: "55",
                  prefixxIcon: Icon(Icons.abc),
                  controller: emailController),
              SizedBox(
                height: appTheme.spaces.space_500,
              ),
              TextFieldWidget(
                  hinttText: "55",
                  prefixxIcon: Icon(Icons.abc),
                  controller: passwordController),
              ElevatedButtonWidget(
                text: "save",
                onPressed: () => ref
                    .read(authenticationProvider.notifier)
                    .login(
                        context, emailController.text, passwordController.text),
              ),
              InkWell(
                onTap: () => ref
                    .read(authenticationProvider.notifier)
                    .googleverification(context),
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: SvgPicture.asset("assets/icons/ic_google_icon.svg"),
                ),
              ),
              TextButton(
                onPressed: () => context.go(SignupPage.routePath),
                child: Text("Signup"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
