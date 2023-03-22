import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:efficacy_user/models/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constant/endpoints.dart';
import '../services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/club_model.dart';

class ClubProvider with ChangeNotifier {
  Future<List<ClubModel>?> fetchAllClub() async {
    try {
      await InternetAddress.lookup("firebasestorage.googleapis.com");
      await InternetAddress.lookup("efficacybackend.onrender.com");
    } on SocketException catch (e) {
      Fluttertoast.showToast(msg: "Couldn't connect to the internet");
      return [];
    }
    try {
      var snapshot = await FirebaseFirestore.instance.collection('Clubs').get();
      List<ClubModel> clubs = [];
      List<Contact> moderators = [];
      for (int i = 0; i < snapshot.docs.length; i++) {
        Map clubData = snapshot.docs.elementAt(i).data();
        moderators.clear();
        if (clubData["moderators"] != null) {
          for (int j = 0; j < (clubData["moderators"] ?? []).length; j++) {
            if (clubData["moderators"][j] != null) {
              moderators.add(Contact(
                  name: clubData["moderators"][j]["name"] ?? '',
                  phNumber: clubData["moderators"][j]["phone"] ?? '',
                  position: clubData["moderators"][j]["position"] ?? ''));
            }
          }
        }
        clubs.add(ClubModel(
            clubId: snapshot.docs.elementAt(i).id,
            clubName: clubData["clubName"] ?? '',
            clubLogoURL: clubData["clubLogoUrl"] ?? '',
            clubDescription: clubData["clubDescription"] ?? '',
            fbPageUrl: clubData["fbPageUrl"] ?? '',
            instagramUrl: clubData["instagramUrl"] ?? '',
            linkedlnURL: clubData["linkedlnURL"] ?? '',
            moderators: moderators,
            followers: []));
      }
      return clubs;
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

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
