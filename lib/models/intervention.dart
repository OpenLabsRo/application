import 'package:json_annotation/json_annotation.dart';
part 'intervention.g.dart';

@JsonSerializable(explicitToJson: true)
class Intervention {
  Intervention();
  factory Intervention.fromJson(Map<String, dynamic> json) =>
      _$InterventionFromJson(json);

  Map<String, dynamic> toJson() => _$InterventionToJson(this);
}
