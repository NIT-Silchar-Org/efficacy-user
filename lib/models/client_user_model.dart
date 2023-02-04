import 'package:json_annotation/json_annotation.dart';

part 'client_user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ClientUserModel {
  final String name;
  final String userID;
  final String Email;
  final String phNumber;
  String? scholarID;
  String? branch;

  List<String>? subscriptions = ["FQ0YthDf9vh5sG2uU0vI"];

  ClientUserModel({
    required this.name,
    required this.userID,
    required this.Email,
    required this.phNumber,
    this.scholarID,
    this.branch,
    this.subscriptions,
  });

  // factory ClientUserModel.fromJson(Map<String, dynamic> json) => _$ClientUserModelFromJson(json);

  //  Map<String, dynamic> toJson() => _$ClientUserModelFromJson(this);
}