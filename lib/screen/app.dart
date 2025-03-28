
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          ),
          const SizedBox(height: 5),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 40
            ),
            child: ElevatedButton(
              onPressed: (){}, 
              style: ButtonStyle(
                backgroundColor:  WidgetStateProperty.all(Color.fromARGB(255, 57, 124, 26))
              ),
              child: Container(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: (){
                    currentIndex += 1;
                  },
                  child: Text('Next', style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                  ),),
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