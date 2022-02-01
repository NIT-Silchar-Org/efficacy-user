// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_screen_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedScreenModel _$FeedScreenModelFromJson(Map<String, dynamic> json) =>
    FeedScreenModel(
      clubLogoURL: json['clubLogoURL'] as String,
      posterURL: json['posterURL'] as String,
      eventID: json['eventID'] as String,
      eventName: json['eventName'] as String,
      shortDescription: json['shortDescription'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
    );

Map<String, dynamic> _$FeedScreenModelToJson(FeedScreenModel instance) =>
    <String, dynamic>{
      'clubLogoURL': instance.clubLogoURL,
      'posterURL': instance.posterURL,
      'eventID': instance.eventID,
      'eventName': instance.eventName,
      'shortDescription': instance.shortDescription,
      'startTime': instance.startTime.toIso8601String(),
    };
