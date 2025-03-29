// quiz_storage_service.dart
import 'dart:convert';

import 'package:one_quiz/data/quiz_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizStorageService {
  static const String _quizResultsKey = 'quiz_results';

  Future<void> saveQuizResult(QuizResult result) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final existingResults = await getQuizResults();
      existingResults.add(result);
      
      // Convert to JSON and save
      final resultsJson = existingResults.map((r) => r.toJson()).toList();
      await prefs.setStringList(_quizResultsKey, 
          resultsJson.map((json) => json.toString()).toList());
    } catch (e) {
      print('Error saving quiz result: $e');
    }
  }

  Future<List<QuizResult>> getQuizResults() async {
    final prefs = await SharedPreferences.getInstance();
    final resultsJson = prefs.getStringList(_quizResultsKey) ?? [];
    
    return resultsJson.map((jsonString) {
      try {
        final json = jsonDecode(jsonString);
        return QuizResult.fromJosn(json);
      } catch (e) {
        print('Error parsing quiz result: $e');
        return null;
      }
    }).whereType<QuizResult>().toList();
  }
}