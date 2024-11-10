import 'package:json_annotation/json_annotation.dart';
import 'package:application/models/intervention.dart';
import 'package:application/models/patient.dart';
import 'package:application/models/primary_evaluation.dart';
import 'package:application/models/secondary_evaluation.dart';
import 'package:application/models/procedures.dart';

part 'case.g.dart';

@JsonSerializable(explicitToJson: true)
class Case {
  final String id;
  final String dispatcherID;

  final Intervention intervention;
  final Patient patient;

  final PrimaryEvaluation primaryEvaluation;
  final SecondaryEvaluation secondaryEvaluation;

  final Procedures procedures;

  final String teamID;
  final String hospitalID;
  final DateTime createdAt;

  Case({
    required this.id,
    required this.dispatcherID,
    required this.intervention,
    required this.patient,
    required this.primaryEvaluation,
    required this.secondaryEvaluation,
    required this.procedures,
    required this.teamID,
    required this.hospitalID,
    required this.createdAt,
  });

  factory Case.fromJSON(Map<String, dynamic> json) => _$CaseFromJson(json);

  Map<String, dynamic> toJSON() => _$CaseToJson(this);
}
