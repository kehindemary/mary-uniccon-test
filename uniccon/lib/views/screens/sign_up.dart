import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/utils/custom_router.dart';
import 'package:uniccon/utils/custom_toast.dart';
import 'package:uniccon/utils/validator.dart';
import 'package:uniccon/views/reuseableWidgets/custom_button.dart';
import 'package:uniccon/views/reuseableWidgets/custom_input.dart';
import 'package:uniccon/views/reuseableWidgets/screen_template.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';
import 'package:uniccon/views/screens/password_screen.dart';
import 'package:uniccon/views/screens/sign_in.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  static String routeName = 'SignUp';

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isValid = false;

  final signUpKey = GlobalKey<FormState>();

  validateData() {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty) {
      isValid = true;
    } else {
      isValid = false;
    }
  }

  Future<void> handleSubmit() async {
    if (!signUpKey.currentState!.validate()) {
      return;
    }
    validateData();
    CustomRouter.push(PasswordScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: 'Create your account',
      subTitle: 'Let’s start by creating your Akiba account',
      size: 12,
      children: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => CustomRouter.push(SignIn.routeName),
            child: const Text.rich(
              TextSpan(
                text: 'Already have an account? ',
                style: TextStyle(color: CustomColors.neutralMain500),
                children: [
                  TextSpan(
                    text: 'Log In',
                    style: TextStyle(
                      fontSize: 12,
                      decorationStyle: TextDecorationStyle.dashed,
                      color: CustomColors.primaryMain500,
                    ),
                  )
                ],
              ),
            ),
          ),
          Form(
            key: signUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YMargin(30),
                CustomInputField(
                  hintText: 'John doe',
                  inputType: TextInputType.text,
                  label: 'Full name',
                  validator: requiredField,
                  controller: firstNameController,
                  onChanged: (value) {
                    validateData();
                  },
                ),
                CustomInputField(
                  hintText: 'Doe',
                  inputType: TextInputType.text,
                  label: 'Last name',
                  validator: requiredField,
                  controller: lastNameController,
                  onChanged: (value) {
                    validateData();
                  },
                ),
                CustomInputField(
                  hintText: 'john@gmail.com',
                  inputType: TextInputType.emailAddress,
                  label: 'Email address',
                  validator: emailValidator,
                  controller: emailController,
                  onChanged: (value) {
                    validateData();
                  },
                ),
                CustomInputField(
                  hintText: 'John doe',
                  inputType: TextInputType.number,
                  label: 'Mobile Number',
                  validator: requiredField,
                  controller: phoneNumberController,
                  onChanged: (value) {
                    validateData();
                  },
                ),
                const YMargin(90),
                TextButton(
                  onPressed: () {},
                  child: const Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'By continuing, you agree to Akiba’s ',
                        style: TextStyle(color: CustomColors.neutralMain500),
                        children: [
                          TextSpan(
                            text: 'Term of Service ',
                            style: TextStyle(
                              fontSize: 12,
                              color: CustomColors.primaryMain500,
                            ),
                          ),
                          TextSpan(
                            text: 'and ',
                            style: TextStyle(
                              fontSize: 12,
                              color: CustomColors.neutralMain500,
                            ),
                          ),
                          TextSpan(
                            text: 'acknowledge our Privacy Policy. ',
                            style: TextStyle(
                              fontSize: 12,
                              color: CustomColors.primaryMain500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const YMargin(12),
                CustomButton(
                  text: 'Continue',
                  color: isValid
                      ? CustomColors.primaryMain500
                      : CustomColors.disableColor,
                  padding: const EdgeInsets.all(10),
                  borderColor:
                      isValid ? Colors.transparent : CustomColors.disableColor,
                  onPressed: () {
                    isValid
                        ? handleSubmit()
                        : customToast(
                            message: 'All fields are required',
                            color: CustomColors.warningColor);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
