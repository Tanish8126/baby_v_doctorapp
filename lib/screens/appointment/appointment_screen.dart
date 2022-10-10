import 'package:baby_v_doctorapp/utils/constants.dart';
import 'package:baby_v_doctorapp/utils/dafault_button2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/size_config.dart';

class AppointmentScreen extends StatefulWidget {
  static String routeName = '/appointmentscreen';
  AppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Stream<QuerySnapshot> appointmentList =
      FirebaseFirestore.instance.collection('bookings').snapshots();

  bool setDefaultMake = true;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: appointmentList,
        builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List bookingdatanew = [];

          snapshot.data?.docs.map((DocumentSnapshot document) {
            Map bookdata = document.data() as Map<String, dynamic>;
            bookingdatanew.add(bookdata);
            print(bookingdatanew);
          }).toList();
          return Scaffold(
            appBar: AppBar(
                title: const Text(
                  'Appointements',
                ),
                centerTitle: true),
            body: Column(
              children: [
                Text(
                  'Upcoming Appointments',
                  style: TextStyle(fontSize: 20, color: Colors.black87),
                ),
                Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: bookingdatanew.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      return Padding(
                        padding:
                            EdgeInsets.all(getProportionateScreenWidth(12)),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kbg),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: SizeConfig.screenHeight * 0.015),
                                  buildOption(
                                    context,
                                    'Parent Name: ${document["userName"]}',
                                  ),
                                  buildOption(context,
                                      'Baby Name: ${document["babyName"]}'),
                                  buildOption(context,
                                      'Mobile Number: ${document["phoneNumber"]}'),
                                  buildOption(context,
                                      'Email Id: ${document["email"]}'),
                                  buildOption(context,
                                      'Gender: ${document["babyGender"]}'),
                                  buildOption(context,
                                      'Booking Start: ${DateFormat('dd-MM-yyyy : h:mm a').format(document["bookingStart"].toDate())}'),
                                  buildOption(context,
                                      'Booking End: ${DateFormat('yyyy-MM-dd : h:mm a').format(document["bookingEnd"].toDate())}'),
                                  buildOption(context,
                                      'Doctor Name: ${document["doctorName"]}'),
                                  SizedBox(
                                      height: SizeConfig.screenHeight * 0.015),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }));
  }
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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DefaultButton2(
            press: () {},
            text: 'Confirm',
          ),
          DefaultButton2(
            press: () {},
            text: 'Cancel',
          ),
        ],
      ),
      const Divider(
        thickness: 2,
      )
    ],
  );
}

buildOption(
  BuildContext context,
  String title,
) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: kbg,
          ),
        ),
      ],
    ),
  );
}
