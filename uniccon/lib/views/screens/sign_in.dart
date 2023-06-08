import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/utils/custom_router.dart';
import 'package:uniccon/utils/custom_toast.dart';
import 'package:uniccon/utils/validator.dart';
import 'package:uniccon/views/reuseableWidgets/custom_button.dart';
import 'package:uniccon/views/reuseableWidgets/custom_input.dart';
import 'package:uniccon/views/reuseableWidgets/screen_template.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

// ignore: must_be_immutable
class SignIn extends StatelessWidget {
   SignIn({super.key});
  static String routeName = 'SignIn';

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
 bool isValid = false;

  final signInKey = GlobalKey<FormState>();

  validateData() {
    if (
        emailController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty) {
      isValid = true;
    } else {
      isValid = false;
    }
  }

   Future<void> handleSubmit() async {
    if (!signInKey.currentState!.validate()) {
      return;
    }
    CustomRouter.push(SignIn.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: 'Create your account',
      subTitle:
          'Let’s start by creating your Akiba account. Already have an account? Log in',
      children: Form(
        key: signInKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              inputType: TextInputType.text,
              label: 'Mobile Number',
              validator: requiredField,
              controller: phoneNumberController,
              onChanged: (value) {
                validateData();
              },
            ),
            const YMargin(12),
            TextButton(
              onPressed: () {},
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'By continuing you agree to the ',
                    style: TextStyle(color: CustomColors.neutralMain500),
                    children: [
                      TextSpan(
                        text: 'Term of Service ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.neutralMain700,
                        ),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.neutralMain500,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy of IderaOS LLC ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.neutralMain700,
                        ),
                      ),
                      TextSpan(
                        text: 'of ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.neutralMain500,
                        ),
                      ),
                      TextSpan(
                        text: 'IderaOS LLC ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.neutralMain700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const YMargin(22),
            CustomButton(
              text: 'Create a new account',
              color: isValid
                  ? CustomColors.primaryMain500
                  : CustomColors.neutralMain500,
              padding: const EdgeInsets.all(10),
              borderColor: isValid
                  ? Colors.transparent
                  : CustomColors.neutralMain500,
              onPressed: () {
                isValid
                    ? handleSubmit()
                    : customToast(
                        message: 'All fields are required',
                        color: CustomColors.warningColor);
              },
            ),
            TextButton(
              onPressed: () => CustomRouter.push(SignIn.routeName),
              child: const Center(
                child: Text.rich(
                  TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: CustomColors.neutralMain500),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.primaryMain500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
