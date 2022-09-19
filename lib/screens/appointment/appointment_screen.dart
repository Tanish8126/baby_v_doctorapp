import 'package:baby_v_doctorapp/utils/dafault_button2.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

class AppointmentScreen extends StatefulWidget {
  static String routeName = '/appointmentscreen';
  AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
          title: Text(
            'Appointements',
          ),
          centerTitle: true),
      body: SafeArea(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Upcoming Appointments',
                style: TextStyle(fontSize: 20, color: Colors.black38),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Hello World',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Hello World',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DefaultButton2(
                          press: () {},
                          text: 'Confirm',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Cancel',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Modify',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Hello World',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Modify',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Hello World',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Hello World',
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                        SizedBox(width: 15),
                        DefaultButton2(
                          press: () {},
                          text: 'Button',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
