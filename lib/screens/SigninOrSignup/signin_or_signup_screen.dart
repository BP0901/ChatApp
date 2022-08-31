import 'package:flutter/material.dart';
import 'package:mychatapp/components/primary_button.dart';
import 'package:mychatapp/constants.dart';
import 'package:mychatapp/screens/SigninOrSignup/signin_sceen.dart';
import 'package:mychatapp/screens/SigninOrSignup/signup_screen.dart';

class SigninOrSignupScreen extends StatelessWidget {
  const SigninOrSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Hero(
              tag: "mainlogo",
              child: Image.asset(
                MediaQuery.of(context).platformBrightness == Brightness.light
                    ? "assets/images/Logo_light.png"
                    : "assets/images/Logo_dark.png",
                height: 146,
              ),
            ),
            Spacer(),
            PrimaryButton(
                key: null,
                text: "Đăng nhập",
                press: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SigninScreen()))),
            SizedBox(
              height: kDefaultPadding * 1.5,
            ),
            PrimaryButton(
                color: Theme.of(context).colorScheme.secondary,
                key: null,
                text: "Đăng ký",
                press: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupScreen()))),
            Spacer(
              flex: 2,
            )
          ],
        ),
      )),
    );
  }
}
