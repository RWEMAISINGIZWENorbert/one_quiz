
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:one_quiz/components/answer_options.dart';
import 'package:one_quiz/components/quiz_header.dart';
import 'package:one_quiz/model/quiz_model.dart';
import 'package:one_quiz/screen/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
   int currentIndex = 0;
   int actualIndex = 1;
  //  bool selected =  false;
  //  String selectedAnswer = '';
  //  String questionId = '';
   Map<String, String> answers = {};
   Map<String, String> selectedAnswers = {};
   Map<String, String> correctAnswers = {};
   List<QuizModel> quizData = QuizModel.initQuiz();

  //  @override
  // void setState(void hy) {
  //   selected = !selected;
  // }

  @override
  void initState() {
    super.initState();
    // Initialize correct answers map
    correctAnswers = {
      for (var question in quizData) question.id: question.correctAnswer
    };
  }

    void _handleAnswerSelected(String questionId, String answer) {
    setState(() {
      selectedAnswers[questionId] = answer;
    });
  }

  Future<void> _submitQuiz() async {
    int score = 0;
    for (var question in quizData) {
      if (selectedAnswers[question.id] == question.correctAnswer) {
        score++;
      }
    }
    
    // Save results to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('last_score', score);
    await prefs.setInt('total_questions', quizData.length);
    
    // Save each answer individually
    for (var entry in selectedAnswers.entries) {
      await prefs.setString('answer_${entry.key}', entry.value);
    }

     Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => MyResult(
          score: score,
          totalQuestions: quizData.length,
          selectedAnswers: selectedAnswers,
          correctAnswers: correctAnswers,
          questions: quizData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int lastIndex = quizData.length - 1;
    final currentQuestion = quizData[currentIndex];

    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 44,),
          Row(
            children: [
              IconButton(
                 onPressed: (){},
                 icon: Icon(Icons.arrow_back_ios)
                ),
              const SizedBox(width: 72),
              Center(
                child: Text(
                  'Math quiz', 
                  style: Theme.of(context).textTheme.titleMedium
                  ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          QuizHeader(
            currentIndex: currentIndex,
            actualIndex: actualIndex
            ),
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
              AnswerOptions(
                // currentIndex: currentIndex,
                // selectedAnswer: selectedAnswer,
                // questionId: '','
                currentQuestion: currentQuestion,
                selectedAnswer: selectedAnswers[currentQuestion.id] ?? '',
                onAnswerSelected: _handleAnswerSelected,
                ),
            ],
          ),
          const SizedBox(height: 5),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 40
            ),
            child: ElevatedButton(
              // onPressed: () async {
              // // int lastIndex = quizData.length - 1; 
              //  setState(() {
              //     if(currentIndex < lastIndex){
              //       currentIndex += 1;
              //       actualIndex += 1;
              //     }
              //   questionId = questionId;  
              // });
              //   if(currentIndex == lastIndex){
              //       Navigator.push(
              //         context, 
              //         MaterialPageRoute(builder: (context) => MyResult()
              //         )
              //         );
              //     }
              //     final SharedPreferences prfs = await SharedPreferences.getInstance(); 
              //     await prfs.setString('question id $questionId', selectedAnswer).whenComplete(() => print('question $questionId and $selectedAnswer added successfully')); 
              // }, 
                onPressed: () async {
                if (selectedAnswers[currentQuestion.id] == null && currentIndex != lastIndex) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please select an answer'), ),
                  );
                  return;
                }
                if (currentIndex < lastIndex) {
                  setState(() {
                    currentIndex += 1;
                    actualIndex += 1;
                  });
                } else {
                  // final SharedPreferences prefs = await SharedPreferences.getInstance();
                  // // Save all answers
                  // for (var entry in answers.entries) {
                  //   await prefs.setString(entry.key, entry.value);
                  //   final data = await prefs.getString(entry.key);
                  //   print(data);
                  // }              
                  // Navigator.push(
                  //   // ignore: use_build_context_synchronously
                  //   context, 
                  //   MaterialPageRoute(builder: (context) => const MyResult()),
                  // );
                  await _submitQuiz();
                }
              }, 
              style: ButtonStyle(
                backgroundColor:  WidgetStateProperty.all(Color.fromARGB(255, 57, 124, 26))
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text( 
                  currentIndex != lastIndex ? 'Next': 'Submit', style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white
                ),
                ),
                )
              ),
          ),
            const Spacer()   
        ],
      ),
    );
  }

}