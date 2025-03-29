 class QuizResult {
  final String quizId;
  final String quizName;
  final Map<String, String> answers; // questionId: selectedAnswer
  final DateTime completedAt;
 
  QuizResult({
    required this.quizId,
    required this.quizName,
    required this.answers,
    required this.completedAt
  });

  Map<String, dynamic> toJson() => {
    'quizId': quizId,
    'quizName': quizName,
    'answers': answers,
    'completedAt': completedAt.toIso8601String()
  };

  factory QuizResult.fromJsn(Map<String, dynamic> json) => 
     QuizResult(
       quizId: json['quizId'],
       quizName: json['quizName'],
       answers:  Map<String, String>.from(json['answers']),
       completedAt: DateTime.parse(json['completedAt'])
     );

 }