import 'package:json_annotation/json_annotation.dart';
part 'patient.g.dart';

@JsonSerializable(explicitToJson: true)
class Patient {
  String? cnp;

  String? firstName;
  String? lastName;

  int? age;
  String? birthdate;

  int? weight;
  String? sex;

  String? homeAddress;

  String? allergies;
  String? diseases;

  Patient(
      {this.cnp,
      this.firstName,
      this.lastName,
      this.age,
      this.birthdate,
      this.weight,
      this.sex,
      this.homeAddress,
      this.allergies,
      this.diseases});

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);

  Map<String, dynamic> toJson() => _$PatientToJson(this);
}
