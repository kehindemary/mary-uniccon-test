import 'package:flutter/material.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/views/reuseableWidgets/custom_button.dart';
import 'package:uniccon/views/reuseableWidgets/custom_text.dart';
import 'package:uniccon/views/reuseableWidgets/y_margin.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});
  static String routeName = 'SuccessScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const YMargin(300),
            const Center(
              child: SizedBox(
                width: 330,
                child: Column(
                  children: [
                    CustomText(
                      text: 'Account Created!',
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: CustomColors.black,
                    ),
                    YMargin(10),
                    CustomText(
                      textAlign: TextAlign.center,
                        text:
                            'Dear @kiks_faboro your Akiba account has\nbeen successfully created. Continue to \nstart using app'),
                  ],
                ),
              ),
            ),
            const YMargin(300),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                text: 'Continue',
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
