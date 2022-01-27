import 'package:efficacy_user/models/contacts_model.dart';

class ClubModel {
  String clubId,
      clubName,
      clubLogoURL,
      clubDescription,
      fbPageUrl,
      instagramUrl,
      linkedlnURL;
  List<Contact> moderators;
  List<String> followers;
  ClubModel(
      {required this.clubId,
      required this.clubName,
      required this.clubLogoURL,
      required this.clubDescription,
      required this.fbPageUrl,
      required this.instagramUrl,
      required this.linkedlnURL,
      required this.moderators,
      required this.followers});
}
