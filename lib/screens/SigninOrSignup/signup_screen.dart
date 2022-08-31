import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mychatapp/components/primary_button.dart';
import 'package:mychatapp/constants.dart';
import 'package:mychatapp/firebase/firebase_auth.dart';
import 'package:mychatapp/screens/SigninOrSignup/signin_sceen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _firebaseAuthor = FirAuth();
  bool _passStatetus = true;
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _repasswordController = new TextEditingController();
  TextEditingController _phoneNumberController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  var _emailErr = "Email không hợp lệ";
  var _passErr = "Mật khẩu không hợp lệ";
  var _isEmailValid = true;
  var _isPassValid = true;
  var _isSamePass = true;
  var _repassErr = "Mật khẩu không trùng khớp";
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
                        labelText: "Tên",
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: "SĐT",
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        errorText: _isEmailValid ? null : _emailErr,
                        labelStyle: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextField(
                            controller: _passwordController,
                            obscureText: _passStatetus,
                            decoration: InputDecoration(
                                errorText: _isPassValid ? null : _passErr,
                                labelText: "Mật khẩu",
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ),
                      TextButton(
                          onPressed: _showOrHidePass,
                          child: Text(
                            _passStatetus ? "Hiện" : "Ẩn",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ))
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: TextField(
                            controller: _repasswordController,
                            obscureText: _passStatetus,
                            decoration: InputDecoration(
                                errorText: _isSamePass ? null : _repassErr,
                                labelText: "Nhập lại mật khẩu",
                                labelStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ),
                      TextButton(
                          onPressed: _showOrHidePass,
                          child: Text(
                            _passStatetus ? "Hiện" : "Ẩn",
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
                    text: "Đăng ký",
                    press: _signInAnAccount,
                  ),
                ),
              ),
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
    DatabaseReference _data =
        FirebaseDatabase(https://mychatapp-ef472-default-rtdb.asia-southeast1.firebasedatabase.app).instance.reference().child("user");
    _data.set(_usernameController.text);

    // setState(() {
    //   bool emailValid = RegExp(
    //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    //       .hasMatch(_usernameController.text);
    //   if (emailValid)
    //     _isEmailValid = true;
    //   else
    //     _isEmailValid = false;

    //   if (_passwordController.text == "123")
    //     _isPassValid = true;
    //   else
    //     _isPassValid = false;

    //   if (_isPassValid) {
    //     if (_passwordController.text != _repasswordController.text)
    //       _isSamePass = false;
    //     else
    //       _isSamePass = true;
    //   }

    //   if (_isEmailValid && _isPassValid && _isSamePass)
    //     _firebaseAuthor.signUp(
    //         _usernameController.text,
    //         _passwordController.text,
    //         _nameController.text,
    //         _phoneNumberController.text, () {
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (context) => SigninScreen()));
    //     });
    // });
  }
}
