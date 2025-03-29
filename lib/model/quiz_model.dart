// import 'package:uuid/uuid.dart';

class QuizModel {
  final String id;
  final String questionName;
  final List<String> options;
  final String  correctAnswer;

  QuizModel({
    required this.id,
    required this.options,
    required this.questionName,
    required this.correctAnswer
  });

  static List<QuizModel> initQuiz(){
      // var id = Uuid().v4();
      List<QuizModel> quizData = [];
      quizData.add(
        QuizModel(
          id: '1',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '3' 
          ));
      quizData.add(
        QuizModel(
          id: '2',
          questionName: 'What is 1 + 2',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '3' 
          ));
      quizData.add(
        QuizModel(
          id: '3',
          questionName: 'What is 1 + 3',
          options: ['trrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','rirnifrirrurrs;jaiasiosa[saksaksasa]', 'yrrrepr[peeeeeeeeeeeeeeeeeep]', '6477777777ndh', 'tewqoiw'],
          correctAnswer: '4' 
          ));
      quizData.add(
        QuizModel(
          id: '4',
          questionName: 'What is 1 + 4',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '5' 
          ));
      quizData.add(
        QuizModel(
          id: '5',
          questionName: 'What is 1 + 5',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '6' 
          ));
      quizData.add(
        QuizModel(
          id: '6',
          questionName: 'What is 1 + 6',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '7' 
          ));
      quizData.add(
        QuizModel(
          id: '7',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '2' 
          ));
      quizData.add(
        QuizModel(
          id: '8',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '2' 
          ));
      quizData.add(
        QuizModel(
          id: '9',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '2' 
          ));
      quizData.add(
        QuizModel(
          id: '10',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          correctAnswer: '2' 
          ));
      return quizData;
  }
   
}