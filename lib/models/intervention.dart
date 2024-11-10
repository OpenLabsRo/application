import 'package:json_annotation/json_annotation.dart';
part 'intervention.g.dart';

@JsonSerializable(explicitToJson: true)
class TimeFrames {
  DateTime? teamDeparture;
  DateTime? caseArrival;
  DateTime? caseDeparture;
  DateTime? hospitalArrival;

  TimeFrames(
      {this.teamDeparture,
      this.caseArrival,
      this.caseDeparture,
      this.hospitalArrival});

  factory TimeFrames.fromJson(Map<String, dynamic> json) =>
      _$TimeFramesFromJson(json);

  Map<String, dynamic> toJson() => _$TimeFramesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Intervention {
  String? caseCode;
  String? activationProtocol;

  String? solicitant;
  String? callerPhone;

  String? emergencyCode;

  String? address;
  String? addressDetails;

  String? hazards;
  String? assets;

  String? reason;

  TimeFrames? timeFrames;

  Intervention({
    this.caseCode,
    this.activationProtocol,
    this.solicitant,
    this.callerPhone,
    this.emergencyCode,
    this.address,
    this.addressDetails,
    this.hazards,
    this.assets,
    this.reason,
    this.timeFrames,
  });

  factory Intervention.fromJson(Map<String, dynamic> json) =>
      _$InterventionFromJson(json);

  Map<String, dynamic> toJson() => _$InterventionToJson(this);
}
