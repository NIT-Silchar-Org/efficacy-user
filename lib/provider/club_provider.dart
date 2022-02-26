import 'package:flutter/material.dart';

import '../constant/endpoints.dart';
import '../services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/club_model.dart';

class ClubProvider with ChangeNotifier {
  Future<ClubModel> fetchClub(String clubId) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final newEndPoint = getclub + token.toString();
      final response = await NetworkEngine()
          .post(endPoint: newEndPoint, data: {'clubId': clubId});
      var details = response.data['data'];
      ClubModel club = ClubModel.fromJson(details);
      return club;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> subUnsubClub(String postId, String action) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final newEndPoint = subunsubclub + token.toString();
      final response = await NetworkEngine().post(
        data: {'postId': postId, 'action': action},
        endPoint: newEndPoint,
      );
      var detail = response.data['success'] as bool;
      return detail;
    } catch (e) {
      rethrow;
    }
  }
}
