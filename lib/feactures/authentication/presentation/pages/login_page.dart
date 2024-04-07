import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/sign_up_page.dart';
import 'package:store_admin_app/feactures/authentication/presentation/providers/auth_provider.dart';
import 'package:store_admin_app/feactures/authentication/presentation/widgets/auth_elevated_button.dart';
import 'package:store_admin_app/feactures/authentication/presentation/widgets/form_feild_password_widget.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/form_text_feild_widget.dart';

class LoginPage extends HookConsumerWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final appTheme = AppTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "STORE ADMIN APP",
              style: TextStyle(
                color: appTheme.colors.text,
                fontSize: appTheme.spaces.space_300,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SizedBox(
                          height: 150,
                          width: 300,
                          child: Lottie.asset(
                              "assets/animations/signuppage.json",
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: appTheme.spaces.space_500,
                  ),
                  SizedBox(
                    height: appTheme.spaces.space_200,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "EMAIL",
                      style: TextStyle(fontSize: appTheme.spaces.space_200),
                    ),
                  ),
                  SizedBox(
                    height: appTheme.spaces.space_100,
                  ),
                  FormTextFieldWidget(
                      validator: (value) {
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!);

                        if (value!.isEmpty) {
                          return "Enter Email";
                        }

                        if (!emailValid) {
                          return "Enter Valid Email";
                        }
                      },
                      hinttText: "EMAIL",
                      keyboardtype: TextInputType.emailAddress,
                      prefixxIcon: Icon(
                        Icons.email_outlined,
                        color: appTheme.colors.primary,
                      ),
                      controller: emailController),
                  SizedBox(
                    height: appTheme.spaces.space_300,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: appTheme.spaces.space_200),
                    child: Text(
                      "PASSWORD",
                      style: TextStyle(fontSize: appTheme.spaces.space_200),
                    ),
                  ),
                  SizedBox(
                    height: appTheme.spaces.space_150,
                  ),
                  PasswordFormTextFieldWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (passwordController.text.length < 6) {
                          return "Password Lenght should be more than 6 characters";
                        }
                      },
                      hinttText: "PASSWORD",
                      keyboardtype: TextInputType.number,
                      controller: passwordController),
                  SizedBox(
                    height: appTheme.spaces.space_400,
                  ),
                  ElevatedButtonWidget(
                      text: "Login ",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        } else {
                          ref.read(authenticationProvider.notifier).login(
                              context,
                              emailController.text,
                              passwordController.text);
                        }
                      }
                      // =>
                      ),
                  SizedBox(
                    height: appTheme.spaces.space_150,
                  ),
                  AuthElevatedButtonWidget(
                    text: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: SvgPicture.asset(
                              "assets/icons/ic_google_icon.svg"),
                        ),
                        SizedBox(
                          width: appTheme.spaces.space_100,
                        ),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(color: appTheme.colors.text),
                        ),
                      ],
                    ),
                    onPressed: () => ref
                        .read(authenticationProvider.notifier)
                        .googleverification(context),
                    colours: appTheme.colors.textDisabled,
                  ),
                  SizedBox(
                    height: appTheme.spaces.space_150,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Do not have an account . Please"),
                        TextButton(
                          onPressed: () => context.go(SignupPage.routePath),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: appTheme.colors.primary),
                                  borderRadius: BorderRadius.circular(32),
                                  color: appTheme.colors.textDisabled),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  "SignUp",
                                  style:
                                      TextStyle(color: appTheme.colors.primary),
                                ),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
