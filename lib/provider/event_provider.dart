import 'dart:convert';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
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
}
