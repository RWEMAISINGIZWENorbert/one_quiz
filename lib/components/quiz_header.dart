
import 'package:flutter/material.dart';
import 'package:one_quiz/model/quiz_model.dart';

class QuizHeader extends StatelessWidget {
  final int currentIndex;
  final int actualIndex;
  final int timeRemaining;
  const QuizHeader({super.key, required this.currentIndex, required this.actualIndex, required this.timeRemaining});

  @override
  Widget build(BuildContext context) {
    List<QuizModel> quizData = QuizModel.initQuiz();
    final double screenWidth = MediaQuery.of(context).size.width;

    return Column(
          children: [
             Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Text>[
                  Text(
                    '$actualIndex of ${quizData.length}',
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: quizData.length,
                itemBuilder: (context, index){
                  return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),  
                  width: screenWidth / quizData.length,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: currentIndex == index ? Colors.blue : Theme.of(context).cardColor,
                  ),
                  );
                }
                ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: timeRemaining < 5 ? (Colors.red ) :const Color(0xFF5EE61F),
                    ),
                    child: Text(
                      '00:$timeRemaining',
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
  }
}