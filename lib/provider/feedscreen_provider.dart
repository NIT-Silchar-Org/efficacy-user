import 'package:efficacy_user/constant/endpoints.dart';
import 'package:efficacy_user/models/feed_screen_model.dart';
import 'package:efficacy_user/services/service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedscreenProvider {
  Future<FeedScreenModel> fetchfeed(List<String> clubsID) async {
    try {
      final token = await FirebaseAuth.instance.currentUser!.getIdToken();
      final newendpoint = getfeed + token.toString();

      final response = await NetworkEngine()
          .post(endPoint: newendpoint, data: {'clubID': clubsID});
      var details = response.data['data'];
      FeedScreenModel dev = FeedScreenModel.fromJson(details);
      return dev;
    } catch (e) {
      rethrow;
    }
  }
}
