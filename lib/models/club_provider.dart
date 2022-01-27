import 'dart:convert';

import 'package:efficacy_user/widgets/subscribe_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './club_model.dart';

class ClubProvider with ChangeNotifier {
  ClubModel fetchClub(String clubId) {
    try{
      final token = FirebaseAuth.instance.currentUser!.getIdToken();
      final response = networkHandler().getevent('event/$clubId');
      var details = json.decode(response.body)['data'];
      ClubModel club = ClubModel.fromJson(details);
      return club;
    }
    catch(e) {
      rethrow;
    }
  }

  Future<bool> subUnsubClub(String postId, String action) async {
    bool status;
    try {
      final response = await NetworkEngine().dio.post('/fam/subUnsubClub'),
        data: {'fullPostId': postId, 'action': action};
        dynamic data = response.data;
        status = data['success'] as bool;
    } catch (e) {
      rethrow;
    }
    return status;
  }
}