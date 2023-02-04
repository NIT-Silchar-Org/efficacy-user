// To parse this JSON data, do
//
//     final allEvent = allEventFromJson(jsonString);

import 'dart:convert';

List<AllEvent> allEventFromJson(String str) =>
    List<AllEvent>.from(json.decode(str).map((x) => AllEvent.fromJson(x)));

String allEventToJson(List<AllEvent> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllEvent {
  AllEvent({
    this.eventId,
    this.clubId,
    this.name,
    this.description,
    this.longDescription,
    this.duration,
    this.startTime,
    this.endTime,
    this.fbPostUrl,
    this.googleFormUrl,
    this.posterUrl,
    this.venue,
    this.likeCount,
    this.usersWhoLiked,
    this.contacts,
  });

  String? eventId;
  String? clubId;
  String? name;
  String? description;
  String? longDescription;
  String? duration;
  DateTime? startTime;
  DateTime? endTime;
  String? fbPostUrl;
  String? googleFormUrl;
  String? posterUrl;
  String? venue;
  int? likeCount;
  List<String>? usersWhoLiked;
  List<Contact>? contacts;

  factory AllEvent.fromJson(Map<String, dynamic> json) => AllEvent(
        eventId: json["eventID"],
        clubId: json["clubID"],
        name: json["name"],
        description: json["description"],
        longDescription: json["longDescription"],
        duration: json["duration"],
        startTime: DateTime.tryParse(json['startTime'].toString()),
        endTime: DateTime.tryParse(json['endTime'].toString()),
        fbPostUrl: json["fbPostURL"],
        googleFormUrl: json["googleFormURL"],
        posterUrl: json["posterURL"],
        venue: json["venue"],
        likeCount: json["likeCount"],
        usersWhoLiked: json["usersWhoLiked"] == null
            ? null
            : List<String>.from(json["usersWhoLiked"].map((x) => x)),
        contacts: json["contacts"] == null
            ? null
            : List<Contact>.from(
                json["contacts"].map((x) => Contact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "eventID": eventId,
        "clubID": clubId,
        "name": name,
        "description": description,
        "longDescription": longDescription,
        "duration": duration,
        "startTime": startTime,
        "endTime": endTime,
        "fbPostURL": fbPostUrl,
        "googleFormURL": googleFormUrl,
        "posterURL": posterUrl,
        "venue": venue,
        "likeCount": likeCount,
        "usersWhoLiked": usersWhoLiked == null
            ? null
            : List<dynamic>.from(usersWhoLiked?.map((x) => x) ?? {}),
        "contacts": contacts == null
            ? null
            : List<dynamic>.from(contacts?.map((x) => x.toJson()) ?? {}),
      };
}

class Contact {
  Contact({
    this.name,
    this.email,
    this.phone,
  });

  String? name;
  String? email;
  String? phone;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
      };
}
