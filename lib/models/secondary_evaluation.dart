import 'package:json_annotation/json_annotation.dart';
part 'secondary_evaluation.g.dart';

@JsonSerializable(explicitToJson: true)
class SecondaryEvaluation {
  SecondaryEvaluation();
  factory SecondaryEvaluation.fromJson(Map<String, dynamic> json) =>
      _$SecondaryEvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$SecondaryEvaluationToJson(this);
}
