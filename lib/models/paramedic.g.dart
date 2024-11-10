// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paramedic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paramedic _$ParamedicFromJson(Map<String, dynamic> json) => Paramedic(
      paramedicID: json['paramedicID'] as String,
      accountID: json['accountID'] as String,
      certified: json['certified'] as bool,
      teamID: json['teamID'] as String,
    );

Map<String, dynamic> _$ParamedicToJson(Paramedic instance) => <String, dynamic>{
      'paramedicID': instance.paramedicID,
      'accountID': instance.accountID,
      'certified': instance.certified,
      'teamID': instance.teamID,
    };
