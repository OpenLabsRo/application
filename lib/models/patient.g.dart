// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      cnp: json['cnp'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      age: (json['age'] as num?)?.toInt(),
      birthdate: json['birthdate'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      sex: json['sex'] as String?,
      homeAddress: json['homeAddress'] as String?,
      allergies: json['allergies'] as String?,
      diseases: json['diseases'] as String?,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'cnp': instance.cnp,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'age': instance.age,
      'birthdate': instance.birthdate,
      'weight': instance.weight,
      'sex': instance.sex,
      'homeAddress': instance.homeAddress,
      'allergies': instance.allergies,
      'diseases': instance.diseases,
    };
