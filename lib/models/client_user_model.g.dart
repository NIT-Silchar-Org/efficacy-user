// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClientUserModel _$ClientUserModelFromJson(Map<String, dynamic> json) =>
    ClientUserModel(
      name: json['name'] as String,
      userID: json['userId'] as String,
      Email: json['Email'] as String,
      phNumber: json['phNumber'] as String,
      year: json['year'] as String?,
      scholarID: json['scholarID'] as String?,
      branch: json['branch'] as String?,
      subscriptions: (json['subscriptions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ClientUserModelToJson(ClientUserModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'userID': instance.userID,
      'year': instance.year,
      'Email': instance.Email,
      'phNumber': instance.phNumber,
      'scholarID': instance.scholarID,
      'branch': instance.branch,
      'subscriptions': instance.subscriptions,
    };
