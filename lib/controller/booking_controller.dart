import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/booking_models.dart';

CollectionReference bookings =
    FirebaseFirestore.instance.collection('bookings');

CollectionReference<SportBooking> getBookingStream({required String placeId}) {
  return bookings
      .doc(placeId)
      .collection('bookings')
      .withConverter<SportBooking>(
        fromFirestore: (snapshots, _) =>
            SportBooking.fromJson(snapshots.data()!),
        toFirestore: (snapshots, _) => snapshots.toJson(),
      );
}
