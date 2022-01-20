import 'package:efficacy_user/models/contacts_model.dart';

class EventModel {
  EventModel({
    this.usersWhoLiked,
    this.eventId,
    this.posterURL,
    this.shortDescription,
    this.longDescription,
    this.eventName,
    this.clubId,
    this.clubName,
    this.clubLogoURL,
    this.fbPostUrl,
    this.googleFormURL,
    this.startTime,
    this.endTime,
    this.venue,
    this.contacts,
  });
  List<String>? usersWhoLiked;
  List<Contact>? contacts;
  DateTime? startTime, endTime;
  String? eventName,
      eventId,
      posterURL,
      shortDescription,
      longDescription,
      clubId,
      clubName,
      clubLogoURL,
      fbPostUrl,
      googleFormURL,
      venue;
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['usersWhoLiked'] = usersWhoLiked;
    data['likeCount'] = usersWhoLiked!.length;
    data['eventId'] = eventId;
    data['posterURL'] = posterURL;
    data['shortDescription'] = shortDescription;
    data['longDescription'] = longDescription;
    data['eventName'] = eventName;
    data['clubId'] = clubId;
    data['clubName'] = clubName;
    data['clubLogoURL'] = clubLogoURL;
    data['fbPostUrl'] = fbPostUrl;
    data['googleFormURL'] = googleFormURL;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['venue'] = venue;
    data['duration'] = endTime!.difference(startTime!);
    data['contacts'] = contacts;
    return data;
  }
}
