// import 'package:flutter/widgets.dart';

// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:store_admin_app/core/widgets/common_widgets/text_fleid_widget.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/login_page.dart';
import 'package:store_admin_app/feactures/authentication/presentation/providers/auth_provider.dart';

class SignupPage extends HookConsumerWidget {
  static const routePath = '/signup';
  const SignupPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    // final constants = ref.watch(signupPageConstantsProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("signup"
              // constants.txtSignupTitle
              ),
          actions: [
            IconButton(
                onPressed: () => context.go(LoginPage.routePath),
                icon: const Icon(Icons.login))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                    height: 150,
                    width: 300,
                    child: Lottie.asset("assets/animations/signuppage.json",
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email"
                        // constants.txtEmailLabel,
                        ),
                    const SizedBox(height: 8),
                    TextFieldWidget(
                        hinttText: "",
                        // Loginpagetext.textfliedemail,
                        prefixxIcon: Icon(Icons.abc),
                        // Loginpagetext.emailprefixicon,
                        controller: emailController),
                    const SizedBox(height: 24),
                    Text("ygtgj"
                        // constants.txtPasswordPlaceholder,
                        ),
                    const SizedBox(height: 8),
                    TextFieldWidget(
                        hinttText: "",
                        // Loginpagetext.textfliedpassword,
                        prefixxIcon: Icon(Icons.abc),
                        //  Loginpagetext.passwordprefixicon,
                        // suffixxIcon:
                        // Loginpagetext.passwordsuffixicon,
                        controller: passwordController),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () => ref
                          .read(authenticationProvider.notifier)
                          .signup(context, emailController.text,
                              passwordController.text),
                      child: Text("tfguedrftgyh"
                          // constants.txtSignupBtnLabel
                          ),
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () => ref
                          .read(authenticationProvider.notifier)
                          .googleverification(context),
                      child: const Text("GOOGLE"),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
