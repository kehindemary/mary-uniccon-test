import 'package:flutter/material.dart';
import 'package:uniccon/constants/constants.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/utils/custom_router.dart';
import 'package:uniccon/views/reuseableWidgets/bottom_navigation.dart';
import 'package:uniccon/views/reuseableWidgets/custom_button.dart';
import 'package:uniccon/views/reuseableWidgets/custom_input.dart';
import 'package:uniccon/views/reuseableWidgets/custom_password_field.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
  SignIn({super.key});
  static String routeName = 'SignIn';

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final signInKey = GlobalKey<FormState>();

  Future<void> handleSubmit() async {
    CustomRouter.push(DashboardScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('$icon/login-img.png'), fit: BoxFit.cover),
            ),
          ),
          Container(
            height: 700,
            decoration: const BoxDecoration(
              color: CustomColors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Form(
                key: signInKey,
                child: SizedBox(
                  height: 300,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const YMargin(10),
                        const CustomText(
                          text: 'Welcome back 👋',
                          size: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        const Text.rich(
                          TextSpan(
                            text:
                                'Log in to your Akiba account. \nNew to Akiba? ',
                            style: TextStyle(
                                color: CustomColors.neutralMain500,
                                fontSize: 16,
                                height: 1.4),
                            children: [
                              TextSpan(
                                text: 'Create an account',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: CustomColors.primaryMain500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const YMargin(30),
                        CustomInputField(
                          hintText: 'john@gmail.com',
                          inputType: TextInputType.emailAddress,
                          label: 'Email address or username',
                          controller: emailController,
                        ),
                        CustomPasswordField(
                          inputLabel: 'Password',
                          hintText: '',
                          controller: passwordController,
                        ),
                        const YMargin(12),
                        CustomButton(
                            height: 55,
                            text: 'Login',
                            onPressed: () {
                              handleSubmit();
                            }),
                        Center(
                            child: TextButton(
                                onPressed: () {},
                                child: const CustomText(
                                  text: 'Reset password?',
                                  color: CustomColors.primaryMain500,
                                  size: 16,
                                )))
                      ]),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
