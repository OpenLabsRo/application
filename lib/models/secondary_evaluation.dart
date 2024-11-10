import 'package:json_annotation/json_annotation.dart';
part 'secondary_evaluation.g.dart';

@JsonSerializable(explicitToJson: true)
class UsualSymptoms {
  bool? nausea;
  bool? vomiting;
  bool? perspiration;
  bool? dizziness;
  bool? pain;

  UsualSymptoms({
    this.nausea,
    this.vomiting,
    this.perspiration,
    this.dizziness,
    this.pain,
  });

  factory UsualSymptoms.fromJson(Map<String, dynamic> json) =>
      _$UsualSymptomsFromJson(json);

  Map<String, dynamic> toJson() => _$UsualSymptomsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TraumaFracture {
  bool? open;
  bool? closed;

  TraumaFracture({
    this.open,
    this.closed,
  });

  factory TraumaFracture.fromJson(Map<String, dynamic> json) =>
      _$TraumaFractureFromJson(json);

  Map<String, dynamic> toJson() => _$TraumaFractureToJson(this);
}

@JsonSerializable(explicitToJson: true)
class TraumaBurn {
  bool? airwaysAffected;
  bool? flame;
  bool? liquid;
  bool? solids;
  bool? vapors;
  bool? gas;
  bool? chemical;

  TraumaBurn({
    this.airwaysAffected,
    this.flame,
    this.liquid,
    this.solids,
    this.vapors,
    this.gas,
    this.chemical,
  });

  factory TraumaBurn.fromJson(Map<String, dynamic> json) =>
      _$TraumaBurnFromJson(json);

  Map<String, dynamic> toJson() => _$TraumaBurnToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Trauma {
  bool? wound;
  bool? contusion;
  TraumaFracture? fracture;
  TraumaBurn? burn;
  bool? hypothemia;
  bool? drowning;

  Trauma({
    this.wound,
    this.contusion,
    this.fracture,
    this.burn,
    this.hypothemia,
    this.drowning,
  });
  factory Trauma.fromJson(Map<String, dynamic> json) => _$TraumaFromJson(json);

  Map<String, dynamic> toJson() => _$TraumaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SecondaryEvaluation {
  UsualSymptoms? usualSymptoms;
  Trauma? trauma;

  SecondaryEvaluation({
    this.usualSymptoms,
    this.trauma,
  });
  factory SecondaryEvaluation.fromJson(Map<String, dynamic> json) =>
      _$SecondaryEvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$SecondaryEvaluationToJson(this);
}
