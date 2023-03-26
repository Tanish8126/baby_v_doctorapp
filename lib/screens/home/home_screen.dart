import 'package:baby_v_doctorapp/screens/appointment/appointment_screen.dart';
import 'package:baby_v_doctorapp/screens/home/components/appointmentbanner.dart';
import 'package:baby_v_doctorapp/screens/home/components/drawer.dart';
import 'package:baby_v_doctorapp/screens/home/components/notification_screen.dart';
import 'package:baby_v_doctorapp/utils/dafault_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "Bavy V Care Doctor's App",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, NotificationScreen.routename);
              },
              icon: const Icon(
                Icons.notifications_active,
                color: Colors.white,
                size: 35,
              ),
            ),
          )
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      drawer: const DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(child: AppointmentBanner()),
            const SizedBox(
              height: 100,
            ),
            DefaultButton(
              press: () {
                Navigator.pushNamed(context, AppointmentScreen.routeName);
              },
              text: 'All Appointments',
            ),
          ],
        ),
      ),
    );
  }
}
