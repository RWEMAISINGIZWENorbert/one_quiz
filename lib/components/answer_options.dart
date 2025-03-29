import 'package:easy_radio/easy_radio.dart';
import 'package:flutter/material.dart';
import 'package:one_quiz/model/quiz_model.dart';

class AnswerOptions extends StatefulWidget {
  // final int currentIndex;
  // final String selectedAnswer;
  // final String questionId;
  final QuizModel currentQuestion;
  final String selectedAnswer;
  final Function(String, String) onAnswerSelected;

  const AnswerOptions({
    super.key, 
    // required this.currentIndex, 
    // required this.selectedAnswer,
    // required this.questionId
    required this.currentQuestion, 
    required this.selectedAnswer,
    required this.onAnswerSelected,
    });

  @override
  State<AnswerOptions> createState() => _AnswerOptionsState();
}

class _AnswerOptionsState extends State<AnswerOptions> {
  // bool selected = false;
  //  int? _groupValue =  -1;
    int? _selectedIndex;
  //  late String selectedAnswer;
  //  late String questionId;
  // @override
  // void initState() {
  //   super.initState();
  //   selectedAnswer = widget.selectedAnswer;
  //   questionId = widget.questionId;
  // }
  //   @override
  // void initState() {
  //   super.initState();
  //   // Initialize with the selected answer if it exists
  //   final index = widget.currentQuestion.options.indexOf(widget.selectedAnswer);
  //   _groupValue = index >= 0 ? index : null;
  // }

    @override
  void initState() {
    super.initState();
    // Initialize with the selected answer if it exists
    if (widget.selectedAnswer.isNotEmpty) {
      _selectedIndex = widget.currentQuestion.options.indexOf(widget.selectedAnswer);
    }
  }

    @override
  void didUpdateWidget(AnswerOptions oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update selection when question changes
    if (widget.selectedAnswer != oldWidget.selectedAnswer) {
      _selectedIndex = widget.selectedAnswer.isNotEmpty
          ? widget.currentQuestion.options.indexOf(widget.selectedAnswer)
          : null;
    }
  }

  @override
  Widget build(BuildContext context) {
      // List<QuizModel> quizData = QuizModel.initQuiz();
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
      // itemCount: quizData[widget.currentIndex].options.length,
      itemCount: widget.currentQuestion.options.length,
      itemBuilder: (context, index){
        // questionId = quizData[widget.currentIndex].id;
         // ignore: no_leading_underscores_for_local_identifiers
         return ListTile(
          leading: EasyRadio(
            value: index, 
            groupValue: _selectedIndex, 
            dotColor: Color.fromARGB(255, 57, 124, 26) ,
            activeBorderColor: Color.fromARGB(255, 57, 124, 26),
            inactiveBorderColor: Theme.of(context).hintColor,
            dotStyle: DotStyle.check(),
            onChanged: (value){
              setState(() {
                _selectedIndex = value;  
                // if(_groupValue == index){
                //   selectedAnswer = quizData[widget.currentIndex].options[index];
                //   // selectedAnswer = quizData[widget.currentIndex].options[index!.toInt()];
                // }
                 });
                widget.onAnswerSelected(
                  widget.currentQuestion.id,
                  widget.currentQuestion.options[value!],
                );
                // print( 'selcted answer: $selectedAnswer');;
            }
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 10, right: 6),
              // child: Text(quizData[widget.currentIndex].options[index]),
              child: Text(widget.currentQuestion.options[index]),
            ),
         );
      }
      ),
    );
  }
}