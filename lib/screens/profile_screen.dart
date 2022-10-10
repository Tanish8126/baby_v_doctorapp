import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/size_config.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = '/profilescreen';
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final mobile = FirebaseAuth.instance.currentUser!.phoneNumber;
  final email = FirebaseAuth.instance.currentUser!.email;
  final name = FirebaseAuth.instance.currentUser!.displayName;

  final Stream<QuerySnapshot> usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
            stream: usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print("Something Went Wrong");
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final List storedocs = [];
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map a = document.data() as Map<String, dynamic>;
                storedocs.add(a);
              }).toList();

              return Scaffold(
                body: Container(
                  padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                      },
                      child: ListView(
                        children: [
                          const Text(
                            "Edit Profile",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: kPrimaryColor),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          buildTextField("Full Name", "$name", false),
                          buildTextField("Mobile Number", "$mobile", false),
                          buildTextField("E-mail", "$email", false),
                          buildTextField("Password", "Password", true),
                          buildTextField(
                              "Location", "Yelahanka, Bangalore", false),
                          const SizedBox(
                            height: 35,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                height: getProportionateScreenHeight(50),
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(18),
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              );
            }));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        style: const TextStyle(color: kPrimaryLightColor),
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kTextColor)),
            labelStyle: const TextStyle(color: kPrimaryColor),
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye,
                        color: kPrimaryLightColor),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kPrimaryLightColor)),
      ),
    );
  }
}
