import 'package:flutter/material.dart';
import 'package:mychatapp/screens/welcome/welcome_screen.dart';
import 'package:mychatapp/theme.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _firebaseApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),

      home: FutureBuilder(
        future: _firebaseApp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("you have error! ${snapshot.error.toString()}");
            return Text("Something went wrong");
          } else if (snapshot.hasData)
            return WelcomeScreen();
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}
