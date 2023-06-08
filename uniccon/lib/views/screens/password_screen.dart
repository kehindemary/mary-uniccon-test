import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uniccon/constants/constants.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/utils/custom_router.dart';
import 'package:uniccon/utils/custom_toast.dart';
import 'package:uniccon/utils/validator.dart';
import 'package:uniccon/views/reuseableWidgets/custom_button.dart';
import 'package:uniccon/views/reuseableWidgets/custom_input.dart';
import 'package:uniccon/views/reuseableWidgets/custom_password_field.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/screen_template.dart';
import 'package:uniccon/views/reuseableWidgets/x_margin.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';
import 'package:uniccon/views/screens/success.dart';

// ignore: must_be_immutable
class PasswordScreen extends StatelessWidget {
  PasswordScreen({super.key});
  static String routeName = 'PasswordScreen';

  final TextEditingController passwordController = TextEditingController();
  bool isValid = false;

  final passwordScreenKey = GlobalKey<FormState>();

  validateData() {
    if (passwordController.text.isNotEmpty) {
      isValid = true;
    } else {
      isValid = false;
    }
  }

  Future<void> handleSubmit() async {
    if (!passwordScreenKey.currentState!.validate()) {
      return;
    }
    CustomRouter.push(SuccessScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      title: 'Set your password',
      subTitle: 'Create your password',
      size: 12,
      children: Form(
        key: passwordScreenKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YMargin(40),
            CustomPasswordField(
              inputLabel: 'Password',
              hintText: '********',
              validator: requiredField,
              controller: passwordController,
              onChanged: (value) {
                validateData();
              },
            ),
            const CustomTile(
              text:
                  'Please set a password with minimum length of 8\ncharacters',
            ),
            const CustomTile(
              text:
                  'Password must contain at least one upper case\nletter,one lower case letter, one numeric\ncharacter, one special character',
            ),
            const YMargin(12),
            CustomInputField(
              hintText: '',
              bottom: 5,
              inputType: TextInputType.text,
              label: 'Referral code (optional)',
              validator: requiredField,
              onChanged: (value) {
                validateData();
              },
            ),
            const CustomText(
              text: 'Please enter an invite code if you have one.',
              color: CustomColors.neutralMain500,
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
    );
  }
}

class CustomTile extends StatelessWidget {
  final String text;
  const CustomTile({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('$icon/check.svg'),
          const XMargin(5),
          CustomText(text: text),
        ],
      ),
    );
  }
}
