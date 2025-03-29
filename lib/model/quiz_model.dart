// import 'package:uuid/uuid.dart';

class QuizModel {
  final String id;
  final String questionName;
  final List<String> options;
  final int  answerINdex;

  QuizModel({
    required this.id,
    required this.options,
    required this.questionName,
    required this.answerINdex
  });

  static List<QuizModel> initQuiz(){
      // var id = Uuid().v4();
      List<QuizModel> quizData = [];
      quizData.add(
        QuizModel(
          id: '1',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '2',
          questionName: 'What is 1 + 2',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '3',
          questionName: 'What is 1 + 3',
          options: ['trrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','rirnifrirrurrs;jaiasiosa[saksaksasa]', 'yrrrepr[peeeeeeeeeeeeeeeeeep]', '6477777777ndh', 'tewqoiw'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '4',
          questionName: 'What is 1 + 4',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '5',
          questionName: 'What is 1 + 5',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '6',
          questionName: 'What is 1 + 6',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '7',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '8',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '9',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: '10',
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      return quizData;
  }
   
}