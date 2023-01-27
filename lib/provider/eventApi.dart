import 'dart:convert';

import 'package:efficacy_user/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EventApi extends ChangeNotifier {
  final String apiLink = "https://efficacybackend.onrender.com/api/all-events/";

  Future<String?> getAllData() async {
    String? err = await getData();
    if (err != null) return err;
    return null;
  }

  List<EventModel>? event;

  Future<String?> getData() async {
    try {
      final response = await http.get(Uri.parse(apiLink));
      final List data = (await jsonDecode(response.body));

      for (var eventDetails in data) {
        EventModel event = EventModel(
          clubId: eventDetails["clubId"],
          eventId: eventDetails["eventId"],
          clubName: eventDetails["clubName"],
          eventName: eventDetails["name"],
          shortDescription: eventDetails["description"],
          longDescription: eventDetails["longDescription"],
          startTime: eventDetails["startTime"],
          endTime: eventDetails["endTime"],
          posterURL: eventDetails["posterURL"],
        );
      }

      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}
