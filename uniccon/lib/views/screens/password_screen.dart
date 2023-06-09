import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uniccon/constants/constants.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/utils/custom_router.dart';
import 'package:uniccon/utils/validator.dart';
import 'package:uniccon/views/reuseableWidgets/custom_back_button.dart';
import 'package:uniccon/views/reuseableWidgets/custom_button.dart';
import 'package:uniccon/views/reuseableWidgets/custom_header_text.dart';
import 'package:uniccon/views/reuseableWidgets/custom_input.dart';
import 'package:uniccon/views/reuseableWidgets/custom_password_field.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
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



  Future<void> handleSubmit() async {
    if (!passwordScreenKey.currentState!.validate()) {
      return;
    }
    CustomRouter.push(SuccessScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Backbutton(),
        Padding(
              padding: const EdgeInsets.all(28.0),
          child: Form(
            key: passwordScreenKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderText(
                      text: 'Set your password',
                      size: 0,
                    ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const CustomText(
                          text:  'Create your password',
                          color: CustomColors.neutralMain500,
                        ),
                        SvgPicture.asset('$icon/password.svg'),
                     ],
                   ),
                const YMargin(30),
                CustomPasswordField(
                  inputLabel: 'Password',
                  hintText: '********',
                  validator: requiredField,
                  controller: passwordController,
                ),
                const CustomTile(
                  text:
                      'Please set a password with minimum length of 8\ncharacters',
                ),
                const CustomTile(
                  text:
                      'Password must contain at least one upper case\nletter,one lower case letter, one numeric\ncharacter, one special character',
                ),
                const YMargin(20),
                const Divider(color: CustomColors.inputBorderColor,),
                const YMargin(30),
                const CustomInputField(
                  hintText: '',
                  bottom: 5,
                  inputType: TextInputType.text,
                  label: 'Referral code (optional)',
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
                  color: CustomColors.primaryMain500,
                  padding: const EdgeInsets.all(10),
                  borderColor: CustomColors.primaryMain500,
                  onPressed: () {
                    handleSubmit();
                  },
                ),
              ],
            ),
          ),
        ),
        ]),),),
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
