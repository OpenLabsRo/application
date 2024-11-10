// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intervention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeFrames _$TimeFramesFromJson(Map<String, dynamic> json) => TimeFrames(
      teamDeparture: json['teamDeparture'] == null
          ? null
          : DateTime.parse(json['teamDeparture'] as String),
      caseArrival: json['caseArrival'] == null
          ? null
          : DateTime.parse(json['caseArrival'] as String),
      caseDeparture: json['caseDeparture'] == null
          ? null
          : DateTime.parse(json['caseDeparture'] as String),
      hospitalArrival: json['hospitalArrival'] == null
          ? null
          : DateTime.parse(json['hospitalArrival'] as String),
    );

Map<String, dynamic> _$TimeFramesToJson(TimeFrames instance) =>
    <String, dynamic>{
      'teamDeparture': instance.teamDeparture?.toIso8601String(),
      'caseArrival': instance.caseArrival?.toIso8601String(),
      'caseDeparture': instance.caseDeparture?.toIso8601String(),
      'hospitalArrival': instance.hospitalArrival?.toIso8601String(),
    };

Intervention _$InterventionFromJson(Map<String, dynamic> json) => Intervention(
      caseCode: json['caseCode'] as String?,
      activationProtocol: json['activationProtocol'] as String?,
      solicitant: json['solicitant'] as String?,
      callerPhone: json['callerPhone'] as String?,
      emergencyCode: json['emergencyCode'] as String?,
      address: json['address'] as String?,
      addressDetails: json['addressDetails'] as String?,
      hazards: json['hazards'] as String?,
      assets: json['assets'] as String?,
      reason: json['reason'] as String?,
      timeFrames: json['timeFrames'] == null
          ? null
          : TimeFrames.fromJson(json['timeFrames'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InterventionToJson(Intervention instance) =>
    <String, dynamic>{
      'caseCode': instance.caseCode,
      'activationProtocol': instance.activationProtocol,
      'solicitant': instance.solicitant,
      'callerPhone': instance.callerPhone,
      'emergencyCode': instance.emergencyCode,
      'address': instance.address,
      'addressDetails': instance.addressDetails,
      'hazards': instance.hazards,
      'assets': instance.assets,
      'reason': instance.reason,
      'timeFrames': instance.timeFrames?.toJson(),
    };
