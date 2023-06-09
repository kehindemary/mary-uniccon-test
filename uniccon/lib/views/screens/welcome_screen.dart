import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uniccon/constants/constants.dart';
import 'package:uniccon/utils/custom_colors.dart';
import 'package:uniccon/utils/custom_router.dart';
import 'package:uniccon/views/screens/sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = 'WelcomeScreen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void handleNavigation() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    CustomRouter.push(SignUp.routeName);
  }

  @override
  void initState() {
    super.initState();
    handleNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryMain500,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 100,
                child: SvgPicture.asset('$icon/icon.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
