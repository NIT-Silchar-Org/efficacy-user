import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String name, scholarid, year, branch, degree, email, phonenum;

  UserModel({
    required this.name,
    required this.scholarid,
    required this.year,
    required this.branch,
    required this.degree,
    required this.email,
    required this.phonenum,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
