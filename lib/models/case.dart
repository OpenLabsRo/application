import 'package:json_annotation/json_annotation.dart';
import 'package:application/models/intervention.dart';
import 'package:application/models/patient.dart';
import 'package:application/models/primary_evaluation.dart';
import 'package:application/models/secondary_evaluation.dart';
import 'package:application/models/procedures.dart';

part 'case.g.dart';

@JsonSerializable(explicitToJson: true)
class Case {
  String? id;
  String? dispatcherID;

  Intervention? intervention;
  Patient? patient;

  PrimaryEvaluation? primaryEvaluation;
  SecondaryEvaluation? secondaryEvaluation;

  Procedures? procedures;

  String? teamID;
  String? hospitalID;
  DateTime? createdAt;

  Case({
    this.id,
    this.dispatcherID,
    this.intervention,
    this.patient,
    this.primaryEvaluation,
    this.secondaryEvaluation,
    this.procedures,
    this.teamID,
    this.hospitalID,
    this.createdAt,
  });

  factory Case.fromJSON(Map<String, dynamic> json) => _$CaseFromJson(json);

  Map<String, dynamic> toJSON() => _$CaseToJson(this);
}
