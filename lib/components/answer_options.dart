import 'package:easy_radio/easy_radio.dart';
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
   int? _groupValue =  -1;
  @override
  Widget build(BuildContext context) {
      List<QuizModel> quizData = QuizModel.initQuiz();
    return SizedBox(
      height: 400,
      // child: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //      crossAxisSpacing: 15,
      //      maxCrossAxisExtent: 160,
      //      mainAxisSpacing: 10,
      //      childAspectRatio: 2.5    
      //   ),
      //   itemCount: quizData[widget.currentIndex].options.length,
      //   itemBuilder: (context, index){
      //      return InkWell(
      //       onTap: (){
      //         print(widget.currentIndex);
      //         if(widget.currentIndex == index){
      //         setState(() {
      //           selected = !selected;
      //         });
      //         }
      //       },
      //        child: Container(
      //         height: 80,
      //         alignment: Alignment.center,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(20),
      //           color: selected ? Color.fromARGB(255, 57, 124, 26) : Theme.of(context).cardColor,
      //         ),
      //         child: Text(
      //           quizData[widget.currentIndex].options[index], 
      //           style: Theme.of(context).textTheme.labelSmall,
      //           ),
      //        ),
      //      );
      //   },
      // ),
    child: ListView.builder(
      itemCount: quizData[widget.currentIndex].options.length,
      itemBuilder: (context, index){
         // ignore: no_leading_underscores_for_local_identifiers

         return ListTile(
          leading: EasyRadio<int>(
            value: index, 
            groupValue: _groupValue, 
            // toggleable: true,
            dotColor: Color.fromARGB(255, 57, 124, 26) ,
            activeBorderColor: Color.fromARGB(255, 57, 124, 26),
            inactiveBorderColor: Theme.of(context).hintColor,
            dotStyle: DotStyle.check(),
            onChanged: (index){
              setState(() {
                // _groupValue = _groupValue == index ? null: index;
                _groupValue = index;
              });
            }
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 10, right: 6),
              child: Text(quizData[widget.currentIndex].options[index]),
            ),
         );
      }
      ),
    );
  }
}