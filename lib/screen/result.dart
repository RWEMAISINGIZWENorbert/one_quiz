
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:one_quiz/model/quiz_model.dart';
import 'package:one_quiz/services/user_account_services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyResult extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final Map<String, String> selectedAnswers;
  final Map<String, String> correctAnswers;
  final List<QuizModel> questions;
  final double totalBalance;

  const MyResult({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.selectedAnswers,
    required this.correctAnswers,
    required this.questions,
    required this.totalBalance
    });

  @override
  Widget build(BuildContext context) {
    
        final bool success = score >= totalQuestions / score;
        final _accountService = UserAccountService();
        

  //  Future<void> _loadBalance() async{
  //   final balance = await _accountService.getBalance();
  //    to
  // }


  final double screenWidth = MediaQuery.of(context).size.width;
    
    return Builder(
      builder: (context) {
         final bettedMoney =  _accountService.viewBetted();
         print("The Betted Money $bettedMoney");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (score > 1) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('You win. Your new Total Balance $totalBalance'),
              ),
            );  }
        });
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
                backgroundColor: score <= 0 ? (Colors.red[700] ?? Colors.red) : (Theme.of(context).cardColor),
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
  );
}
}