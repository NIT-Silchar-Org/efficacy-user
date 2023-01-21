// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'] as String,
      scholarid: json['scholarid'] as String,
      year: json['year'] as String,
      branch: json['branch'] as String,
      degree: json['degree'] as String,
      email: json['email'] as String,
      phonenum: json['phonenum'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'name': instance.name,
      'scholarid': instance.scholarid,
      'year': instance.year,
      'branch': instance.branch,
      'degree': instance.degree,
      'email': instance.email,
      'phonenum': instance.phonenum,
    };
