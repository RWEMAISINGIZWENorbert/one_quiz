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
          questionName: 'Which social media app only lets you view pictures and messages for a limited time ?',
          options: ['Twitter', 'Facebook', 'Snapchat', 'Instagram'],
          correctAnswer: 'Snapchat' 
          ));
      quizData.add(
        QuizModel(
          id: '2',
          questionName: 'In which year the Electronic copany NINTENDO was found ?',
          options: ['1864', '1946', '1889', '1975'],
          correctAnswer: '1889' 
          ));
      quizData.add(
        QuizModel(
          id: '3',
          questionName: 'Originally Amazon only sold which product ?',
          options: ['Food Items', 'Video Games', 'Rugs', 'Books'],
          correctAnswer: 'Books' 
          ));
      quizData.add(
        QuizModel(
          id: '4',
          questionName: 'What is the name of the British computer scientist who invented the World Wide Web in 1989 ?',
          options: ['Tim Berners-Lee',
          'Bernard Hoppkinns',
          'Adam Richman',
          'Terrence Crawford'],
          correctAnswer: 'Tim Berners-Lee' 
          ));
      quizData.add(
        QuizModel(
          id: '5',
          questionName: 'Which duo invented the aeroplane ?',
          options: ['Hardy Brothers',
          'Wright Brothers',
          'The Melvins',
          'Serra Brothers'],
          correctAnswer: 'Wright Brothers' 
          ));
      quizData.add(
        QuizModel(
          id: '6',
          questionName: 'What year did the first Apple iPhone launch ?',
          options: ['2006', '2005', '2009', '2007'],
          correctAnswer: '2007' 
          ));
      quizData.add(
        QuizModel(
          id: '7',
          questionName: 'Which prestigious university did Microsoft founder Bill Gates drop out of ?',
          options: ['Oxford', 'Harvard', 'Belgium', 'Manitoba'],
          correctAnswer: 'Harvard' 
          ));
      quizData.add(
        QuizModel(
          id: '8',
          questionName: 'What does LG stand for in LG Electronics ?',
          options: ['Lucky Goldstar', 'Liquid Glow', 'Light Gaze', 'Lewis Gene'],
          correctAnswer: 'Lucky Goldstar' 
          ));
      quizData.add(
        QuizModel(
          id: '9',
          questionName: 'Solar power generates electricity from what source ?',
          options: ['Moon', 'Star', 'Sun', 'Water'],
          correctAnswer: 'Sun' 
          ));
      quizData.add(
        QuizModel(
          id: '10',
          questionName: 'Billionaire Jeff Bezos is CEO and President of which online retailer ?',
          options: ['Amazon', 'Google', 'Tesla', 'Microsoft'],
          correctAnswer: 'Amazon' 
          ));
      // quizData.add(
      //   QuizModel(
      //     id: '1',
      //     questionName: 'What is 1 + 1',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '3' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '2',
      //     questionName: 'What is 1 + 2',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '3' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '3',
      //     questionName: 'What is 1 + 3',
      //     options: ['trrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr','rirnifrirrurrs;jaiasiosa[saksaksasa]', 'yrrrepr[peeeeeeeeeeeeeeeeeep]', '6477777777ndh', 'tewqoiw'],
      //     correctAnswer: '4' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '4',
      //     questionName: 'What is 1 + 4',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '5' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '5',
      //     questionName: 'What is 1 + 5',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '6' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '6',
      //     questionName: 'What is 1 + 6',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '7' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '7',
      //     questionName: 'What is 1 + 1',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '2' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '8',
      //     questionName: 'What is 1 + 1',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '2' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '9',
      //     questionName: 'What is 1 + 1',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '2' 
      //     ));
      // quizData.add(
      //   QuizModel(
      //     id: '10',
      //     questionName: 'What is 1 + 1',
      //     options: ['1','2', '3', '4', '5'],
      //     correctAnswer: '2' 
      //     ));
      return quizData;
  }
   
}