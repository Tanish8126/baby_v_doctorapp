// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/size_config.dart';

class AppointmentBanner extends StatelessWidget {
  final Stream<QuerySnapshot> appointmentList = FirebaseFirestore.instance
      .collection('bookings')
      .where("doctorName", isEqualTo: "Dr. Mahesh")
      .limit(3)
      .snapshots();
  AppointmentBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        decoration: BoxDecoration(
            color: Colors.blueAccent, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(8)),
          child: Column(children: [
            Text(
              "Upcoming Appointment",
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            const Divider(
              thickness: 2,
            ),
            StreamBuilder<QuerySnapshot>(
                stream: appointmentList,
                builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        'No Upcoming Appointment',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(26),
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    );
                  } else {
                    final List bookingdata1 = [];
                    snapshot.data?.docs.map((DocumentSnapshot document) {
                      Map bookdata1 = document.data() as Map<String, dynamic>;
                      bookingdata1.add(bookdata1);
                    }).toList();

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: bookingdata1.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot document =
                              snapshot.data!.docs[index];
                          return Column(
                            children: [
                              buildAppointmentRow(
                                context,
                                "Patient Name- ${document["userName"]}",
                                "Patient Number- ${document["phoneNumber"]}",
                                'Booking On: ${DateFormat('dd-MM-yyyy - h:mm a').format(document["bookingStart"].toDate())}',
                              ),
                            ],
                          );
                        });
                  }
                }))
          ]),
        ));
  }

  buildAppointmentRow(
    BuildContext context,
    String title1,
    String title2,
    String title3,
  ) {
    return Column(
      children: [
        Text(
          title1,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        Text(
          title2,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        Text(
          title3,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ),
        const Divider(
          thickness: 2,
        )
      ],
    );
  }
}
