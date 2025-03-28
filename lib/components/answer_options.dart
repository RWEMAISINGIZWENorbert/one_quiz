
import 'package:flutter/material.dart';
import 'package:one_quiz/model/quiz_model.dart';

class AnswerOptions extends StatelessWidget {
  const AnswerOptions({super.key});

  @override
  Widget build(BuildContext context) {
      List<QuizModel> quizData = QuizModel.initQuiz();
    int currentInddex = 0;
    return SizedBox(
      height: 400,
      child: GridView.builder(
        gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
           crossAxisSpacing: 15,
           maxCrossAxisExtent: 160,
           mainAxisSpacing: 10,
           childAspectRatio: 2.5    
        ),
        itemCount: quizData[currentInddex].options.length,
        itemBuilder: (context, index){
           return Container(
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).cardColor,
            ),
            child: Text(
              quizData[currentInddex].options[index], 
              style: Theme.of(context).textTheme.labelSmall,
              ),
           );
        },
      ),
    );
  }
}