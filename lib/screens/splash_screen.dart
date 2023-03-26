import 'package:baby_v_doctorapp/screens/login_check.dart';
import 'package:flutter/material.dart';

import '../utils/dafault_button.dart';
import '../utils/size_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splashcreen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/babyvcare.png',
              width: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome to Baby V Care Doctor's App",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const Spacer(flex: 3),
            DefaultButton(
              text: "Continue",
              press: () {
                Navigator.pushNamed(context, LoginCheckScreen.routeName);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
