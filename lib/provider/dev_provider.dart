import 'package:efficacy_user/constant/endpoints.dart';
import 'package:efficacy_user/models/dev_model.dart';
import 'package:efficacy_user/services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DevProvider with ChangeNotifier {
  Future<Developer> fetchDevs() async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final newendpoint = getdev + token.toString();
      final response =
          await NetworkEngine().post(endPoint: newendpoint, data: {});
      var details = response.data['data'];
      Developer dev = Developer.fromJson(details);
      return dev;
    } catch (e) {
      rethrow;
    }
  }
}
