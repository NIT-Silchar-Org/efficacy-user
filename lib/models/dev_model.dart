import 'package:json_annotation/json_annotation.dart';

part 'dev_model.g.dart';

@JsonSerializable()
class Developer {
  String name, imgURL;
  Developer({required this.name, required this.imgURL});

  factory Developer.fromJson(Map<String, dynamic> json) =>
      _$DeveloperFromJson(json);

  Map<String, dynamic> toJson() => _$DeveloperToJson(this);
}
