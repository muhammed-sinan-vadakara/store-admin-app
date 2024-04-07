import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:store_admin_app/core/theme/app_theme.dart';
import 'package:store_admin_app/core/widgets/common_widgets/elevated_button_widget.dart';
import 'package:store_admin_app/core/widgets/common_widgets/text_fleid_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:store_admin_app/feactures/authentication/presentation/pages/login_page.dart';
import 'package:store_admin_app/feactures/authentication/presentation/providers/auth_provider.dart';
import 'package:store_admin_app/feactures/authentication/presentation/widgets/auth_elevated_button.dart';
import 'package:store_admin_app/feactures/home/presentation/widgets/form_text_feild_widget.dart';

class SignupPage extends HookConsumerWidget {
  static const routePath = '/signup';
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
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
            padding:
                EdgeInsets.symmetric(horizontal: appTheme.spaces.space_200),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(appTheme.spaces.space_200),
                      child: SizedBox(
                          height: 150,
                          width: 300,
                          child: Lottie.asset(
                              "assets/animations/signuppage.json",
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    height: appTheme.spaces.space_700,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      "NAME",
                      style: TextStyle(fontSize: appTheme.spaces.space_200),
                    ),
                  ),
                  SizedBox(
                    height: appTheme.spaces.space_100,
                  ),
                  TextFieldWidget(
                      hinttText: "NAME",
                      keyboardtype: TextInputType.name,
                      prefixxIcon: Icon(
                        Icons.person_outline_outlined,
                        color: appTheme.colors.primary,
                      ),
                      controller: nameController),
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
                    height: appTheme.spaces.space_200,
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
                  FormTextFieldWidget(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (passwordController.text.length < 6) {
                          return "Password Lenght should be more than 6 characters";
                        }
                      },
                      hinttText: "PASSWORD",
                      keyboardtype: TextInputType.number,
                      prefixxIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: appTheme.colors.primary,
                      ),
                      controller: passwordController),
                  SizedBox(
                    height: appTheme.spaces.space_400,
                  ),
                  ElevatedButtonWidget(
                      text: "SIGN UP",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        } else {
                          ref.read(authenticationProvider.notifier).signup(
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
                    height: appTheme.spaces.space_50,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account . Please"),
                        TextButton(
                          onPressed: () => context.go(LoginPage.routePath),
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: appTheme.colors.primary),
                                  borderRadius: BorderRadius.circular(32),
                                  color: appTheme.colors.textDisabled),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Text(
                                  "Login",
                                  style:
                                      TextStyle(color: appTheme.colors.primary),
                                ),
                              )),
                        ),
                        SizedBox(
                          height: appTheme.spaces.space_250,
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
