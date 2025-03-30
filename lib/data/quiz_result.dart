 class QuizResult {
  final String quizId;
  final String quizName;
  final Map<String, String> selectedAnswers; // questionId: selectedAnswer
  final Map<String, String> correctAnswers; // questionId: selectedAnswer
  final DateTime completedAt;
 
  QuizResult({
    required this.quizId,
    required this.quizName,
    required this.selectedAnswers,
    required this.correctAnswers,
    required this.completedAt
  });

  Map<String, dynamic> toJson() => {
    'quizId': quizId,
    'quizName': quizName,
    'selectedAnswers': selectedAnswers,
    'completedAt': completedAt.toIso8601String()
  };

  factory QuizResult.fromJson(Map<String, dynamic> json) => 
     QuizResult(
       quizId: json['quizId'],
       quizName: json['quizName'],
       selectedAnswers:  Map<String, String>.from(json['selectedAnswers']),
       correctAnswers:  Map<String, String>.from(json['correctAnswers']),
       completedAt: DateTime.parse(json['completedAt'])
     );

  Map<String, bool> getAnswerStatus() {
    final result = <String, bool>{};
    for (final questionId in selectedAnswers.keys) {
      result[questionId] =  selectedAnswers[questionId] == correctAnswers[questionId];
    }
    return result;
  }  

 }
