import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/size_config.dart';
import '../utils/custom_suffix_icon.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/loginscreen";
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? email;
  String? password;
  bool? remember;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: SingleChildScrollView(
                child: Column(children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  const Text(
                    "Sign in with your email and password",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kPrimaryLightColor),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: kPrimaryLightColor),
                    controller: _emailController,
                    // validator: (value) {
                    //   if (value!.isEmpty) {
                    //     addError(error: kEmailNullError);
                    //     return "";
                    //   } else if (!emailValidatorRegExp.hasMatch(value)) {
                    //     addError(error: kInvalidEmailError);
                    //     return "";
                    //   }
                    //   return null;
                    // },
                    decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kTextColor)),
                        fillColor: kTextColor,
                        labelText: "Email",
                        hintText: "Enter your email",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon:
                            CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
                        hintStyle: TextStyle(color: kPrimaryLightColor),
                        labelStyle: TextStyle(color: kPrimaryColor)),
                  ),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: kPrimaryLightColor),
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: kTextColor)),
                        fillColor: kTextColor,
                        labelText: "Password",
                        hintText: "Enter your password",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon:
                            CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                        hintStyle: TextStyle(color: kPrimaryLightColor),
                        labelStyle: TextStyle(color: kPrimaryColor),
                      )),
                  SizedBox(height: getProportionateScreenHeight(30)),
                  Center(
                    child: InkWell(
                      onTap: () {
                        _signInUser();
                        // Navigator.pushNamed(context, HomeScreen.routeName);
                      },
                      child: Container(
                        width: double.infinity,
                        height: getProportionateScreenHeight(50),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: SizeConfig.screenHeight * 0.08),
                  // _isSigning == true
                  //     ? Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text("Please wait..."),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           CircularProgressIndicator()
                  //         ],
                  //       )
                  //     : Container(),
                  // SizedBox(height: getProportionateScreenHeight(30)),
                ]),
              ),
            )));
  }

  Future _signInUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          )
          .then((value) {});
    } catch (e) {
      // print("some error $e");
    }
  }
}
