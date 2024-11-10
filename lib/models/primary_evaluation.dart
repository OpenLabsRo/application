import 'package:json_annotation/json_annotation.dart';
part 'primary_evaluation.g.dart';

@JsonSerializable(explicitToJson: true)
class MentalConscious {
  bool? normal;
  bool? altered;

  MentalConscious({
    this.normal,
    this.altered,
  });

  factory MentalConscious.fromJson(Map<String, dynamic> json) =>
      _$MentalConsciousFromJson(json);

  Map<String, dynamic> toJson() => _$MentalConsciousToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MentalStatus {
  MentalConscious? conscious;
  bool? unconscious;

  MentalStatus({
    this.conscious,
    this.unconscious,
  });

  factory MentalStatus.fromJson(Map<String, dynamic> json) =>
      _$MentalStatusFromJson(json);

  Map<String, dynamic> toJson() => _$MentalStatusToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AirwaysObstructed {
  bool? fully;
  bool? partially;

  AirwaysObstructed({
    this.fully,
    this.partially,
  });

  factory AirwaysObstructed.fromJson(Map<String, dynamic> json) =>
      _$AirwaysObstructedFromJson(json);

  Map<String, dynamic> toJson() => _$AirwaysObstructedToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Airways {
  bool? open;
  bool? obstructed;

  Airways({
    this.open,
    this.obstructed,
  });

  factory Airways.fromJson(Map<String, dynamic> json) =>
      _$AirwaysFromJson(json);

  Map<String, dynamic> toJson() => _$AirwaysToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BreathingIntubated {
  bool? guedelPipe;
  bool? tube;
  bool? ventilator;
  bool? baloon;

  BreathingIntubated({
    this.guedelPipe,
    this.tube,
    this.ventilator,
    this.baloon,
  });

  factory BreathingIntubated.fromJson(Map<String, dynamic> json) =>
      _$BreathingIntubatedFromJson(json);

  Map<String, dynamic> toJson() => _$BreathingIntubatedToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Breathing {
  bool? normal;
  bool? absent;
  bool? dispnea;
  BreathingIntubated? intubated;

  Breathing({
    this.normal,
    this.absent,
    this.dispnea,
    this.intubated,
  });

  factory Breathing.fromJson(Map<String, dynamic> json) =>
      _$BreathingFromJson(json);

  Map<String, dynamic> toJson() => _$BreathingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CirculationPresent {
  bool? full;
  bool? filiform;
  bool? rhythmic;
  bool? arrhythmic;

  CirculationPresent({
    this.full,
    this.filiform,
    this.rhythmic,
    this.arrhythmic,
  });

  factory CirculationPresent.fromJson(Map<String, dynamic> json) =>
      _$CirculationPresentFromJson(json);

  Map<String, dynamic> toJson() => _$CirculationPresentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Circulation {
  CirculationPresent? present;
  bool? absent;

  Circulation({
    this.present,
    this.absent,
  });

  factory Circulation.fromJson(Map<String, dynamic> json) =>
      _$CirculationFromJson(json);

  Map<String, dynamic> toJson() => _$CirculationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PrimaryEvaluation {
  MentalStatus? mentalStatus;
  Airways? airways;
  Breathing? breathing;
  Circulation? circulation;

  PrimaryEvaluation({
    this.mentalStatus,
    this.airways,
    this.breathing,
    this.circulation,
  });
  factory PrimaryEvaluation.fromJson(Map<String, dynamic> json) =>
      _$PrimaryEvaluationFromJson(json);

  Map<String, dynamic> toJson() => _$PrimaryEvaluationToJson(this);
}
