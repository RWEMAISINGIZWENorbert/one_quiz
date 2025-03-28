
import 'package:flutter/material.dart';
import 'package:one_quiz/components/answer_options.dart';
import 'package:one_quiz/components/quiz_header.dart';
import 'package:one_quiz/model/quiz_model.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
   List<QuizModel> quizData = QuizModel.initQuiz();
   int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Math quiz', 
              style: Theme.of(context).textTheme.titleMedium
              ),
          ),
          const SizedBox(height: 40),
          QuizHeader(),
          const SizedBox(height: 50),
          Column(
            children: [
              Center(
                child: Text(
                  quizData[currentIndex].questionName,
                  style: Theme.of(context).textTheme.labelLarge,
                  ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose the best answer',
                style: Theme.of(context).textTheme.labelSmall,
                ),
              const SizedBox(height: 15),
              AnswerOptions(),
            ],
          )   
        ],
      ),
    );
  }

}