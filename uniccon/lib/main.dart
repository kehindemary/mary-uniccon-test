import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:uniccon/utils/custom_router.dart';
import 'package:uniccon/views/screens/password_screen.dart';
import 'package:uniccon/views/screens/sign_in.dart';
import 'package:uniccon/views/screens/sign_up.dart';
import 'package:uniccon/views/screens/success.dart';
import 'package:uniccon/views/screens/welcome_screen.dart';

import 'utils/custom_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const Uniccon());
}

class Uniccon extends StatelessWidget {
  const Uniccon({
    Key? key,
  }) : super(key: key);

  T? args<T>(BuildContext context, [T? defaultValue]) =>
      ModalRoute.of(context)?.settings.arguments as T? ?? defaultValue;

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        title: 'Uniccon',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.blue,
          fontFamily: 'Inter',
          primaryColor: CustomColors.primaryMain500,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: WelcomeScreen.routeName,
        navigatorKey: CustomRouter.navigatorKey,
        routes: {
          WelcomeScreen.routeName: (context) => const WelcomeScreen(),
          SignUp.routeName: (context) => SignUp(),
          SignIn.routeName: (context) => SignIn(),
          PasswordScreen.routeName: (context) => PasswordScreen(),
            SuccessScreen.routeName: (context) => const SuccessScreen(),
        },
      ),
    );
  }
}
