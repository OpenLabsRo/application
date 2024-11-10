import 'package:json_annotation/json_annotation.dart';
part 'patient.g.dart';

@JsonSerializable(explicitToJson: true)
class Patient {
  Patient();
  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
