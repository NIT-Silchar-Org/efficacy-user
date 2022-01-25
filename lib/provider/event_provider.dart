import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
<<<<<<< HEAD
  EventModel fetchEvent(String eventId) {
    try {
      final token = FirebaseAuth.instance.currentUser!.getIdToken();
      final response = networkhandler().getevent('event/$eventId');
      var details = json.decode(response.body)['data'];
      EventModel event = EventModel.fromJson(details);
      return event;
    } catch (e) {
      throw(e);
    }
  }
=======
  late EventModel _event;
>>>>>>> 62315b35c4bea894a5b4323083582e53fb3c5e1c
}
