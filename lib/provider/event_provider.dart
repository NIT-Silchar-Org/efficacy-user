import 'package:efficacy_user/constant/endpoints.dart';
import 'package:efficacy_user/models/event_model.dart';
import 'package:efficacy_user/services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventProvider with ChangeNotifier {
  Future<EventModel> fetchEvent(String eventId) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final newendpoint = getevent + token.toString();
      final response = await NetworkEngine()
          .post(endPoint: newendpoint, data: {'eventId': eventId});
      var details = response.data['data'];
      EventModel event = EventModel.fromJson(details);
      return event;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> likeunlikeevent(bool action, String eventId) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final newendpoint = likeunlikepost + token.toString();
      final response = await NetworkEngine().post(
          endPoint: newendpoint, data: {'eventId': eventId, 'action': action});
      var detail = response.data['success'] as bool;
      return detail;
    } catch (e) {
      rethrow;
    }
  }
}
