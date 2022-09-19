import 'package:baby_v_doctorapp/screens/home/components/notification_screen.dart';
import 'package:baby_v_doctorapp/screens/profile_screen.dart';
import 'package:baby_v_doctorapp/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';
import '../../../utils/dafault_button.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final Email = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //elevation: 16,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 30),
        child: ListView(children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.network(
                'https://picsum.photos/seed/457/600',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '$Email',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                height: 15,
                thickness: 2,
                color: kMainColor,
              ),
              buildAccountOptionRow(
                  context, "Profile", ProfileScreen.routeName),
              buildAccountOptionRow(context, "Setting", SplashScreen.routeName),
              buildAccountOptionRow(
                  context, "Notifications", NotificationScreen.routename),
              SizedBox(
                height: 50,
              ),
              DefaultButton(
                press: () {},
                text: 'Sign Out',
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

GestureDetector buildAccountOptionRow(
    BuildContext context, String title, String routeName) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: kPrimaryLightColor,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: kPrimaryLightColor,
          ),
        ],
      ),
    ),
  );
}
