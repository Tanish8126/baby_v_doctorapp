import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home/home_screen.dart';
import 'login_screen.dart';

class LoginCheckScreen extends StatelessWidget {
  static String routeName = "/logincheckscreen";
  const LoginCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        });
  }
}
