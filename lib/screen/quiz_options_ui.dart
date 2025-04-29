// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:one_quiz/components/input_cash.dart';
import 'package:one_quiz/model/quiz_options_model.dart';
import 'package:one_quiz/screen/app.dart';
import 'package:one_quiz/services/user_account_services.dart';

class QuizOptionsUi extends StatefulWidget {
  const QuizOptionsUi({super.key});

  @override
  State<QuizOptionsUi> createState() => _QuizOptionsUiState();
  
}

class _QuizOptionsUiState extends State<QuizOptionsUi> {
    final UserAccountService _accountService = UserAccountService();
    TextEditingController betMoneyController = TextEditingController();
    TextEditingController depositMoneyController = TextEditingController();
  // double totalBalance = 2000;
  double totalBalance = 0;
  
    void initState(){
    super.initState();
     _loadBalance();
  }
  Future<void> _loadBalance() async{
    final balance = await _accountService.getBalance();
    setState(() {
      totalBalance = balance;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<QuizOptionsModel> data = QuizOptionsModel.initQuizOptions();
    print('Data ${data[0]}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => {
            Navigator.of(context).pop()
          },
          child: Icon(Icons.arrow_back_ios)
          ),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () =>{ 
              bet_money_model(context, betMoneyController)
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 68, 56, 18),
                child: Text(data[index].name[0]),
              ),
              title: Text(data[index].name),
              subtitle: Text("${data[index].questions}"),
            ),
          );
        }
        ),
    );
  }
  
    // ignore: non_constant_identifier_names
    Future<dynamic> bet_money_model(BuildContext context, TextEditingController betMoneyController) {
    double totalBalance = 0;
    return showModalBottomSheet(
                 context: context, 
                    builder: (context){
                      return SizedBox(
                        height: 700,
                        child: Container(
                          color: Theme.of(context).cardColor,
                          // color: Theme.of(context).hintColor,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 22, horizontal: 26),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Enter the money'),
                                    const SizedBox(height: 8,),
                                    inputCash(context, betMoneyController),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40,),
                              ElevatedButton(
                                onPressed: () async{
                                 double bettedMoney = double.parse(betMoneyController.text);
                                //   setState(() {
                                //      totalBalance += depositedMoney;
                                //   });
                                   final activeBalance = await _accountService.getBalance();
                                   if(bettedMoney > activeBalance){
                                       print("You balance is under $bettedMoney");
                                       Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You balance is under $bettedMoney")));
                                      return;
                                   }
                                   print("On control");
                                   await _accountService.deductMoney(bettedMoney);
                                   await _loadBalance();
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(builder: (context) => App())
                                    );
                                }, 
                                child: Text('submit')
                                )
                            ],
                          ),
                        )
                        );
                    }
                    );
  }

}