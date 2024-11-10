import 'package:json_annotation/json_annotation.dart';
part 'account.g.dart';

@JsonSerializable()
class Account {
  final String id;

  final String firstName;
  final String lastName;

  final String phone;

  Account(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone});

  factory Account.fromJSON(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJSON() => _$AccountToJson(this);
}
