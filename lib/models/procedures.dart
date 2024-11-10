import 'package:json_annotation/json_annotation.dart';
part 'procedures.g.dart';

@JsonSerializable(explicitToJson: true)
class Intubation {
  Intubation();
  factory Intubation.fromJson(Map<String, dynamic> json) =>
      _$IntubationFromJson(json);

  Map<String, dynamic> toJson() => _$IntubationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Ventilation {
  Ventilation();
  factory Ventilation.fromJson(Map<String, dynamic> json) =>
      _$VentilationFromJson(json);

  Map<String, dynamic> toJson() => _$VentilationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Intravenous {
  Intravenous();
  factory Intravenous.fromJson(Map<String, dynamic> json) =>
      _$IntravenousFromJson(json);

  Map<String, dynamic> toJson() => _$IntravenousToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Intraosseous {
  Intraosseous();
  factory Intraosseous.fromJson(Map<String, dynamic> json) =>
      _$IntraosseousFromJson(json);

  Map<String, dynamic> toJson() => _$IntraosseousToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Trauma {
  Trauma();
  factory Trauma.fromJson(Map<String, dynamic> json) => _$TraumaFromJson(json);

  Map<String, dynamic> toJson() => _$TraumaToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Hemostasis {
  Hemostasis();
  factory Hemostasis.fromJson(Map<String, dynamic> json) =>
      _$HemostatisFromJson(json);

  Map<String, dynamic> toJson() => _$HemostasisToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Medication {
  Medication();
  factory Medication.fromJson(Map<String, dynamic> json) =>
      _$MedicationFromJson(json);

  Map<String, dynamic> toJson() => _$MedicationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Procedures {
  Procedures();
  factory Procedures.fromJson(Map<String, dynamic> json) =>
      _$ProceduresFromJson(json);

  Map<String, dynamic> toJson() => _$ProceduresToJson(this);
}
