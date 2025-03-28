
import 'package:flutter/material.dart';
import 'package:one_quiz/model/quiz_model.dart';

class AnswerOptions extends StatefulWidget {
  final int currentIndex;
  const AnswerOptions({super.key, required this.currentIndex});

  @override
  State<AnswerOptions> createState() => _AnswerOptionsState();
}

class _AnswerOptionsState extends State<AnswerOptions> {
   bool selected = false;
  @override
  Widget build(BuildContext context) {
      List<QuizModel> quizData = QuizModel.initQuiz();
    return SizedBox(
      height: 400,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
           crossAxisSpacing: 15,
           maxCrossAxisExtent: 160,
           mainAxisSpacing: 10,
           childAspectRatio: 2.5    
        ),
        itemCount: quizData[widget.currentIndex].options.length,
        itemBuilder: (context, index){
           return InkWell(
            onTap: (){
              print(widget.currentIndex);
              if(widget.currentIndex == index){
              setState(() {
                selected = !selected;
              });
              }
            },
             child: Container(
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: selected ? Color.fromARGB(255, 57, 124, 26) : Theme.of(context).cardColor,
              ),
              child: Text(
                quizData[widget.currentIndex].options[index], 
                style: Theme.of(context).textTheme.labelSmall,
                ),
             ),
           );
        },
      ),
    );
  }
}