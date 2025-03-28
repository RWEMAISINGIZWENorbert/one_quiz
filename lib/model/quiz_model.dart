import 'package:uuid/uuid.dart';

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
      var id = Uuid().v4();
      List<QuizModel> quizData = [];
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 2',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 3',
          options: ['trrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','rirnifrirrurrs;jaiasiosa[saksaksasa]', 'yrrrepr[peeeeeeeeeeeeeeeeeep]', '6477777777ndh', 'tewqoiw'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 4',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 5',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 6',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'Beforet the last question What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      quizData.add(
        QuizModel(
          id: id,
          questionName: 'last quiseion What is 1 + 1',
          options: ['1','2', '3', '4', '5'],
          answerINdex: 1 
          ));
      return quizData;
  }
   
}