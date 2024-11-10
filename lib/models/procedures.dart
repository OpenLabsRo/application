import 'package:json_annotation/json_annotation.dart';
part 'procedures.g.dart';

@JsonSerializable(explicitToJson: true)
class Procedures {
  Procedures();
  factory Procedures.fromJson(Map<String, dynamic> json) =>
      _$ProceduresFromJson(json);

  Map<String, dynamic> toJson() => _$ProceduresToJson(this);
}
