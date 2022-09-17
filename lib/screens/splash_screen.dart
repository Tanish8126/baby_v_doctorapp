import 'package:flutter/material.dart';

import '../utils/dafault_button2.dart';
import '../utils/size_config.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splashcreen";
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: SizedBox(
        height: 700,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/babyvcare.png',
                width: 200,
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Welcome to India's First Baby Vaccination app!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Spacer(flex: 3),
              DefaultButton2(
                text: "Discover more ..",
                press: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
