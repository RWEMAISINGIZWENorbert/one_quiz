
import 'package:flutter/material.dart';
import 'package:one_quiz/model/quiz_model.dart';

class QuizHeader extends StatefulWidget {
  const QuizHeader({super.key});

  @override
  State<QuizHeader> createState() => _QuizHeaderState();
}

class _QuizHeaderState extends State<QuizHeader> {
  @override
  Widget build(BuildContext context) {
    List<QuizModel> quizData = QuizModel.initQuiz();
     int currentInddex = 0;

    return Column(
          children: [
             Container(
              margin: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Text>[
                  Text(
                    '$currentInddex out of ${quizData.length}',
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
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).cardColor,
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
                      color: const Color(0xFF5EE61F),
                    ),
                    child: Text(
                      '3:00',
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