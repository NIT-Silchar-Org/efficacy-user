import 'package:json_annotation/json_annotation.dart';

part 'contacts_model.g.dart';

@JsonSerializable()
class Contact {
  String name, phNumber, position;
  String? email;
  Contact({required this.name, required this.phNumber, required this.position, this.email});
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
