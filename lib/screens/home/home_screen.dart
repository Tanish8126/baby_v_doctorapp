import 'package:baby_v_doctorapp/screens/appointment/appointment_screen.dart';
import 'package:baby_v_doctorapp/screens/home/components/drawer.dart';
import 'package:baby_v_doctorapp/screens/home/components/notification_screen.dart';
import 'package:baby_v_doctorapp/utils/dafault_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      drawer: DrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const Text(
                      "Upcoming Appointments",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        buildAppointmentRow(context,
                            "Date- 27/10/2022 Slot- 1.15-1.30 Patient Name- Mohit"),
                        buildAppointmentRow(context,
                            "Date- 20/10/2022 Slot- 10.15-10.30 Patient Name- Shivam"),
                        buildAppointmentRow(context,
                            "Date- 10/10/2022 Slot- 12.30-12.45 Patient Name- Rahul"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
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

  buildAppointmentRow(
    BuildContext context,
    String title,
  ) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.black),
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
