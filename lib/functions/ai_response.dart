class AIResponse {
  final List<String> procedures;
  final List<String> medication;
  final List<String> alerts;
  final List<String> suggestedQuestions;

  AIResponse({
    required this.procedures,
    required this.medication,
    required this.alerts,
    required this.suggestedQuestions,
  });

  factory AIResponse.fromJson(Map<String, dynamic> json) {
    return AIResponse(
      procedures: List<String>.from(json['Procedures'] ?? []),
      medication: List<String>.from(json['Medication'] ?? []),
      alerts: List<String>.from(json['Alerts'] ?? []),
      suggestedQuestions: List<String>.from(json['SuggestedQuestions'] ?? []),
    );
  }
}
