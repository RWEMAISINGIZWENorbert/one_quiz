
import 'package:flutter/material.dart';
import 'package:one_quiz/components/quiz_header.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
          const SizedBox(height: 40,),
          QuizHeader()
        ],
      ),
    );
  }

}