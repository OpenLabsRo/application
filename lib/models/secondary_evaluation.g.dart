// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secondary_evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsualSymptoms _$UsualSymptomsFromJson(Map<String, dynamic> json) =>
    UsualSymptoms(
      nausea: json['nausea'] as bool?,
      vomiting: json['vomiting'] as bool?,
      perspiration: json['perspiration'] as bool?,
      dizziness: json['dizziness'] as bool?,
      pain: json['pain'] as bool?,
    );

Map<String, dynamic> _$UsualSymptomsToJson(UsualSymptoms instance) =>
    <String, dynamic>{
      'nausea': instance.nausea,
      'vomiting': instance.vomiting,
      'perspiration': instance.perspiration,
      'dizziness': instance.dizziness,
      'pain': instance.pain,
    };

TraumaFracture _$TraumaFractureFromJson(Map<String, dynamic> json) =>
    TraumaFracture(
      open: json['open'] as bool?,
      closed: json['closed'] as bool?,
    );

Map<String, dynamic> _$TraumaFractureToJson(TraumaFracture instance) =>
    <String, dynamic>{
      'open': instance.open,
      'closed': instance.closed,
    };

TraumaBurn _$TraumaBurnFromJson(Map<String, dynamic> json) => TraumaBurn(
      airwaysAffected: json['airwaysAffected'] as bool?,
      flame: json['flame'] as bool?,
      liquid: json['liquid'] as bool?,
      solids: json['solids'] as bool?,
      vapors: json['vapors'] as bool?,
      gas: json['gas'] as bool?,
      chemical: json['chemical'] as bool?,
    );

Map<String, dynamic> _$TraumaBurnToJson(TraumaBurn instance) =>
    <String, dynamic>{
      'airwaysAffected': instance.airwaysAffected,
      'flame': instance.flame,
      'liquid': instance.liquid,
      'solids': instance.solids,
      'vapors': instance.vapors,
      'gas': instance.gas,
      'chemical': instance.chemical,
    };

Trauma _$TraumaFromJson(Map<String, dynamic> json) => Trauma(
      wound: json['wound'] as bool?,
      contusion: json['contusion'] as bool?,
      fracture: json['fracture'] == null
          ? null
          : TraumaFracture.fromJson(json['fracture'] as Map<String, dynamic>),
      burn: json['burn'] == null
          ? null
          : TraumaBurn.fromJson(json['burn'] as Map<String, dynamic>),
      hypothemia: json['hypothemia'] as bool?,
      drowning: json['drowning'] as bool?,
    );

Map<String, dynamic> _$TraumaToJson(Trauma instance) => <String, dynamic>{
      'wound': instance.wound,
      'contusion': instance.contusion,
      'fracture': instance.fracture?.toJson(),
      'burn': instance.burn?.toJson(),
      'hypothemia': instance.hypothemia,
      'drowning': instance.drowning,
    };

SecondaryEvaluation _$SecondaryEvaluationFromJson(Map<String, dynamic> json) =>
    SecondaryEvaluation(
      usualSymptoms: json['usualSymptoms'] == null
          ? null
          : UsualSymptoms.fromJson(
              json['usualSymptoms'] as Map<String, dynamic>),
      trauma: json['trauma'] == null
          ? null
          : Trauma.fromJson(json['trauma'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SecondaryEvaluationToJson(
        SecondaryEvaluation instance) =>
    <String, dynamic>{
      'usualSymptoms': instance.usualSymptoms?.toJson(),
      'trauma': instance.trauma?.toJson(),
    };
