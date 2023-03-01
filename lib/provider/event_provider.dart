import 'dart:convert';

import 'package:efficacy_user/constant/endpoints.dart';
import 'package:efficacy_user/models/all_events.dart';
import 'package:efficacy_user/services/service.dart';
import 'package:efficacy_user/utils/basemodel.dart';
import 'package:efficacy_user/utils/enums.dart';
import 'package:efficacy_user/widgets/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EventProvider extends BaseModel {
  AllEvent event = AllEvent();

  // Future<EventModel> fetchEvent(String eventId) async {
  //   try {
  //     // final token = await FirebaseAuth.instance.currentUser!.getIdToken();
  //     // final newendpoint = getevent + token.toString();
  //     final response = await NetworkEngine()
  //         .post(endPoint: geteventDetails, data: {'eventId': eventId});
  //     // var details = response.data['data'];
  //     // EventModel event = EventModel.fromJson(details);
  //     AllEvent event = allEventFromJson(jsonEncode(response.data));

  //     return event;
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<AllEvent?> fetchEvent(
      {required String eventId, required BuildContext context}) async {
    try {
      state = ViewState.busy;
      await NetworkEngine().post(
        data: {},
        endPoint: 'event-details/$eventId/',
      ).then((response) {
        if (response.statusCode == 200) {
          print('Response : ${jsonEncode(response.data)}');

          AllEvent temp = AllEvent.fromJson(response.data);
          event = AllEvent();
          event = temp;

          return temp;
        } else {
          showSnackBar(context: context, text: 'Something went wrong');
        }
      }).onError((error, stackTrace) {
        print(error.toString());
        print(stackTrace.toString());
        return null;
      });

      state = ViewState.idle;
      notifyListeners();
      return null;
    } catch (e) {
      state = ViewState.idle;
      showSnackBar(context: context, text: 'Something went wrong');
      rethrow;
    }
  }

  Future<bool> likeUnlikeEvent(bool like, String eventId) async {
    try {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      const newEndPoint = likeunlikepost;
      final response = await NetworkEngine().post(endPoint: newEndPoint, data: {
        'eventId': eventId,
        'action': like == true ? "LIKE" : "UNLIKE",
        "userId": token.toString()
      });
      var detail = response.data['success'] as bool ? like : !like;
      return detail;
    } catch (e) {
      return like;
    }
  }
}
