import 'package:json_annotation/json_annotation.dart';

part 'feed_screen_model.g.dart';

@JsonSerializable()
class FeedScreenModel {
  String clubLogoURL, posterURL, eventID, eventName, shortDescription;
  DateTime startTime;
  FeedScreenModel(
      {required this.clubLogoURL,
      required this.posterURL,
      required this.eventID,
      required this.eventName,
      required this.shortDescription,
      required this.startTime});

  factory FeedScreenModel.fromJson(Map<String, dynamic> json) =>
      _$FeedScreenModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeedScreenModelToJson(this);
}
