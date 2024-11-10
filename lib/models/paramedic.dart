import 'package:json_annotation/json_annotation.dart';
part 'paramedic.g.dart';

@JsonSerializable()
class Paramedic {
  final String paramedicID;
  final String accountID;
  final bool certified;
  final String teamID;

  Paramedic({
    required this.paramedicID,
    required this.accountID,
    required this.certified,
    required this.teamID,
  });

  factory Paramedic.fromJson(Map<String, dynamic> json) =>
      _$ParamedicFromJson(json);

  Map<String, dynamic> toJson() => _$ParamedicToJson(this);
}
