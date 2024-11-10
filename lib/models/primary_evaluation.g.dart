// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_evaluation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MentalConscious _$MentalConsciousFromJson(Map<String, dynamic> json) =>
    MentalConscious(
      normal: json['normal'] as bool?,
      altered: json['altered'] as bool?,
    );

Map<String, dynamic> _$MentalConsciousToJson(MentalConscious instance) =>
    <String, dynamic>{
      'normal': instance.normal,
      'altered': instance.altered,
    };

MentalStatus _$MentalStatusFromJson(Map<String, dynamic> json) => MentalStatus(
      conscious: json['conscious'] == null
          ? null
          : MentalConscious.fromJson(json['conscious'] as Map<String, dynamic>),
      unconscious: json['unconscious'] as bool?,
    );

Map<String, dynamic> _$MentalStatusToJson(MentalStatus instance) =>
    <String, dynamic>{
      'conscious': instance.conscious?.toJson(),
      'unconscious': instance.unconscious,
    };

AirwaysObstructed _$AirwaysObstructedFromJson(Map<String, dynamic> json) =>
    AirwaysObstructed(
      fully: json['fully'] as bool?,
      partially: json['partially'] as bool?,
    );

Map<String, dynamic> _$AirwaysObstructedToJson(AirwaysObstructed instance) =>
    <String, dynamic>{
      'fully': instance.fully,
      'partially': instance.partially,
    };

Airways _$AirwaysFromJson(Map<String, dynamic> json) => Airways(
      open: json['open'] as bool?,
      obstructed: json['obstructed'] as bool?,
    );

Map<String, dynamic> _$AirwaysToJson(Airways instance) => <String, dynamic>{
      'open': instance.open,
      'obstructed': instance.obstructed,
    };

BreathingIntubated _$BreathingIntubatedFromJson(Map<String, dynamic> json) =>
    BreathingIntubated(
      guedelPipe: json['guedelPipe'] as bool?,
      tube: json['tube'] as bool?,
      ventilator: json['ventilator'] as bool?,
      baloon: json['baloon'] as bool?,
    );

Map<String, dynamic> _$BreathingIntubatedToJson(BreathingIntubated instance) =>
    <String, dynamic>{
      'guedelPipe': instance.guedelPipe,
      'tube': instance.tube,
      'ventilator': instance.ventilator,
      'baloon': instance.baloon,
    };

Breathing _$BreathingFromJson(Map<String, dynamic> json) => Breathing(
      normal: json['normal'] as bool?,
      absent: json['absent'] as bool?,
      dispnea: json['dispnea'] as bool?,
      intubated: json['intubated'] == null
          ? null
          : BreathingIntubated.fromJson(
              json['intubated'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BreathingToJson(Breathing instance) => <String, dynamic>{
      'normal': instance.normal,
      'absent': instance.absent,
      'dispnea': instance.dispnea,
      'intubated': instance.intubated?.toJson(),
    };

CirculationPresent _$CirculationPresentFromJson(Map<String, dynamic> json) =>
    CirculationPresent(
      full: json['full'] as bool?,
      filiform: json['filiform'] as bool?,
      rhythmic: json['rhythmic'] as bool?,
      arrhythmic: json['arrhythmic'] as bool?,
    );

Map<String, dynamic> _$CirculationPresentToJson(CirculationPresent instance) =>
    <String, dynamic>{
      'full': instance.full,
      'filiform': instance.filiform,
      'rhythmic': instance.rhythmic,
      'arrhythmic': instance.arrhythmic,
    };

Circulation _$CirculationFromJson(Map<String, dynamic> json) => Circulation(
      present: json['present'] == null
          ? null
          : CirculationPresent.fromJson(
              json['present'] as Map<String, dynamic>),
      absent: json['absent'] as bool?,
    );

Map<String, dynamic> _$CirculationToJson(Circulation instance) =>
    <String, dynamic>{
      'present': instance.present?.toJson(),
      'absent': instance.absent,
    };

PrimaryEvaluation _$PrimaryEvaluationFromJson(Map<String, dynamic> json) =>
    PrimaryEvaluation(
      mentalStatus: json['mentalStatus'] == null
          ? null
          : MentalStatus.fromJson(json['mentalStatus'] as Map<String, dynamic>),
      airways: json['airways'] == null
          ? null
          : Airways.fromJson(json['airways'] as Map<String, dynamic>),
      breathing: json['breathing'] == null
          ? null
          : Breathing.fromJson(json['breathing'] as Map<String, dynamic>),
      circulation: json['circulation'] == null
          ? null
          : Circulation.fromJson(json['circulation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PrimaryEvaluationToJson(PrimaryEvaluation instance) =>
    <String, dynamic>{
      'mentalStatus': instance.mentalStatus?.toJson(),
      'airways': instance.airways?.toJson(),
      'breathing': instance.breathing?.toJson(),
      'circulation': instance.circulation?.toJson(),
    };
