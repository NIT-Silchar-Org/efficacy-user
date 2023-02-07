import 'dart:convert';
import 'package:efficacy_user/models/all_events.dart';
import 'package:efficacy_user/services/service.dart';
import 'package:efficacy_user/utils/basemodel.dart';
import 'package:efficacy_user/utils/enums.dart';
import 'package:efficacy_user/widgets/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExploreScreenProvider extends BaseModel {
  List<AllEvent>? allevents = [];

  Future<List<AllEvent>?> fetchAllEvents(
      {required BuildContext context}) async {
    if (state != ViewState.busy && (allevents == null || allevents!.isEmpty)) {
      try {
        state = ViewState.busy;
        await NetworkEngine().post(
          data: {},
          endPoint: 'all-events/',
        ).then((response) {
          if (response.statusCode == 200) {
            print('Response : ${jsonEncode(response.data)}');

            List<AllEvent> temp = allEventFromJson(jsonEncode(response.data));
            allevents?.clear();
            allevents?.addAll(temp);

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
    return null;
  }
}
