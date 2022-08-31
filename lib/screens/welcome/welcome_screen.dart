import 'package:flutter/material.dart';
import 'package:mychatapp/constants.dart';
import 'package:mychatapp/screens/SigninOrSignup/signin_or_signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Image.asset("assets/images/welcome_image.png"),
          Spacer(
            flex: 3,
          ),
          Text(
            "Welcome to MyChatApp",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          Spacer(
            flex: 3,
          ),
          FittedBox(
            child: TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SigninOrSignupScreen())),
                child: Row(
                  children: [
                    Text("Skip",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .color!
                                .withOpacity(0.8))),
                    SizedBox(
                      width: kDefaultPadding / 4,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .color!
                          .withOpacity(0.8),
                    )
                  ],
                )),
          ),
          Spacer(
            flex: 1,
          )
        ],
      )),
    );
  }
}
