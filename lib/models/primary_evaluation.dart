import 'package:json_annotation/json_annotation.dart';
part 'primary_evaluation.g.dart';

@JsonSerializable(explicitToJson: true)
class PrimaryEvaluation {
  PrimaryEvaluation();
  factory PrimaryEvaluation.fromJson(Map<String, dynamic> json) =>
      _$PrimaryEvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$PrimaryEvaluationToJson(this);
}
