import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';

class FirAuth {
  final FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess) {
    _fireBaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {})
        .catchError((err) {
      print("err: " + err.toString());
      _onSignUpErr(err.code);
    });
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInError) {
    _fireBaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
          _createUser(user.uid,)
      onSuccess();
    }).catchError((err) {
      print("err: " + err.toString());
      onSignInError("Sign-In fail, please try again");
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess) {
    var user = Map<String, String>();
    user["name"] = name;
    user["phone"] = phone;

    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((vl) {
      print("on value: SUCCESSED");
      onSuccess();
    }).catchError((err) {
      print("err: " + err.toString());
      // onRegisterError("SignUp fail, please try again");
    }).whenComplete(() {
      print("completed");
    });
  }

  ///
  void _onSignUpErr(String code) {
    // print(code);
    // switch (code) {
    //   case "ERROR_INVALID_EMAIL":
    //   case "ERROR_INVALID_CREDENTIAL":
    //     onRegisterError("Invalid email");
    //     break;
    //   case "ERROR_EMAIL_ALREADY_IN_USE":
    //     onRegisterError("Email has existed");
    //     break;
    //   case "ERROR_WEAK_PASSWORD":
    //     onRegisterError("The password is not strong enough");
    //     break;
    //   default:
    //     onRegisterError("SignUp fail, please try again");
    //     break;
    // }
  }

  Future<void> signOut() async {
    print("signOut");
    return _fireBaseAuth.signOut();
  }
}
