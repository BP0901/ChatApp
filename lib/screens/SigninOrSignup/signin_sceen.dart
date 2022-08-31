import 'package:flutter/material.dart';
import 'package:mychatapp/components/primary_button.dart';
import 'package:mychatapp/constants.dart';
import 'package:mychatapp/screens/chats/chats_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _passStatetus = true;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  var _emailErr = "Email không đúng";
  var _passErr = "Password không đúng";
  var _isEmailValid = true;
  var _isPassValid = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        errorText: _isEmailValid ? null : _emailErr,
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                            controller: _passwordController,
                            obscureText: _passStatetus,
                            decoration: InputDecoration(
                                errorText: _isPassValid ? null : _passErr,
                                labelText: "Password",
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ),
                      TextButton(
                          onPressed: _showOrHidePass,
                          child: Text(
                            _passStatetus ? "Show" : "Hide",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: PrimaryButton(
                    key: null,
                    color: Colors.blue,
                    text: "Sign in",
                    press: _signInAnAccount,
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("New user?"),
                          Text(
                            "Sign up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ]),
                        Row(
                          children: <Widget>[Text("Forgot password?")],
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void _showOrHidePass() {
    setState(() {});
    _passStatetus = !_passStatetus;
  }

  void _signInAnAccount() {
    setState(() {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_usernameController.text);
      if (emailValid)
        _isEmailValid = true;
      else
        _isEmailValid = false;

      if (_passwordController.text == "123")
        _isPassValid = true;
      else
        _isPassValid = false;

      if (_isPassValid && _isEmailValid)
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatSceen()));
    });
  }
}
