
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:one_quiz/model/quiz_model.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyResult extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Map<String, String> selectedAnswers;
  final Map<String, String> correctAnswers;
  final List<QuizModel> questions;

  const MyResult({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.selectedAnswers,
    required this.correctAnswers,
    required this.questions,
    });

  @override
  Widget build(BuildContext context) {
    
        final bool success = score >= totalQuestions / score;

    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon:  Icon(IconlyLight.arrow_left_2)
          ),
      ),
      body:  SizedBox(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               SizedBox(height: screenWidth / 2,),
              CircularPercentIndicator(
                radius:  100,
                lineWidth: 5.0,
                percent: ((score * 100) / totalQuestions) / 100,
                center:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      success ? "Passed" : "failed",
                      style: Theme.of(context).textTheme.labelSmall,
                      ),
                  ],
                ),
                progressColor: success ? Colors.green[700] : Colors.red,
                ),
                const SizedBox(height: 20),
                Text('$score out of $totalQuestions', style: Theme.of(context).textTheme.labelSmall,)
            ],
          ),
        ),
      ),
    );
  }
}