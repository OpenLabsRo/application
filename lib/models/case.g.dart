// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Case _$CaseFromJson(Map<String, dynamic> json) => Case(
      id: json['id'] as String?,
      dispatcherID: json['dispatcherID'] as String?,
      intervention: json['intervention'] == null
          ? null
          : Intervention.fromJson(json['intervention'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      primaryEvaluation: json['primaryEvaluation'] == null
          ? null
          : PrimaryEvaluation.fromJson(
              json['primaryEvaluation'] as Map<String, dynamic>),
      secondaryEvaluation: json['secondaryEvaluation'] == null
          ? null
          : SecondaryEvaluation.fromJson(
              json['secondaryEvaluation'] as Map<String, dynamic>),
      procedures: json['procedures'] == null
          ? null
          : Procedures.fromJson(json['procedures'] as Map<String, dynamic>),
      teamID: json['teamID'] as String?,
      hospitalID: json['hospitalID'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CaseToJson(Case instance) => <String, dynamic>{
      'id': instance.id,
      'dispatcherID': instance.dispatcherID,
      'intervention': instance.intervention?.toJson(),
      'patient': instance.patient?.toJson(),
      'primaryEvaluation': instance.primaryEvaluation?.toJson(),
      'secondaryEvaluation': instance.secondaryEvaluation?.toJson(),
      'procedures': instance.procedures?.toJson(),
      'teamID': instance.teamID,
      'hospitalID': instance.hospitalID,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
