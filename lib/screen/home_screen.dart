import 'package:flutter/material.dart';
import 'package:one_quiz/components/input_cash.dart';
import 'package:one_quiz/screen/app.dart';
import 'package:one_quiz/services/user_account_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserAccountService _accountService = UserAccountService();
  // double totalBalance = 2000;
  double totalBalance = 0;

  @override
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
      TextEditingController depositMoneyController = TextEditingController();
      TextEditingController withdrawMoneyController = TextEditingController();
      TextEditingController betMOneyController = TextEditingController();
      final double screenWidth = MediaQuery.of(context).size.width;
      final double screenHeight = MediaQuery.of(context).size.height;
  //     double depositedMoney  = double.parse(depositMoneyController.text);
  //  void _depositMoney(){
  //   setState(() {
  //     totalBalance += depositedMoney;
  //   });
  //  }
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Center(child: Text('Total Balance: $totalBalance')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: (){
                    deposit_money_model(context, depositMoneyController);
                  }, 
                  child: Text('Deposit')
                  ),
                TextButton(
                  onPressed: (){
                    withdraw_money_model(context, withdrawMoneyController);
                  }, 
                  child: Text('Withdraw')
                  ),
              ],
            ),
            // const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text('Available questions', style: Theme.of(context).textTheme.labelSmall,),
                ),
                InkWell(
                  onTap: (){
                    // Navigator.push(
                    //   context, 
                    //   MaterialPageRoute(
                    //     builder: (context) => App()
                    //     )
                    //   );
                   showDialog(context: context, builder: (context){
                    return AlertDialog(
                      backgroundColor: Theme.of(context).cardColor,
                      scrollable: true,
                      content: Container(
                        height: screenHeight / 2,
                        width:  screenWidth,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Bet to claim your points',
                                style: Theme.of(context).textTheme.displayMedium,
                                )
                              ),
                              const SizedBox(height: 12,),
                              Text(
                                'Enter The money ', 
                                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 15),
                                ),
                              const SizedBox(height: 8,),
                              inputCash(context, betMOneyController),
                              const SizedBox(height: 42,),
                              TextButton(
                                onPressed: () async{
                                   double selectedMoney = double.parse(betMOneyController.text);
                                  
                                   if(selectedMoney > totalBalance){
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          content: Text('You have n\'t enough money'),                                          
                                          ),
                                      );
                                      return;
                                   }
                                   await _accountService.deductMoney(selectedMoney);
                                   await _loadBalance();
                                   Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                      builder: (context) => App()
                                      )
                                    );
                                }, 
                                child: Text('Start')
                                )
                          ],
                        ),
                      ),
                    );
                   });
                  },
                  child: ListTile(
                    leading: Icon(Icons.question_answer_outlined),
                    title: Text(
                      'Mathematics', 
                      style: Theme.of(context).textTheme.labelSmall
                      !.copyWith(fontSize: 15),
                      ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> deposit_money_model(BuildContext context, TextEditingController depositMoneyController) {
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
                                    inputCash(context, depositMoneyController),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40,),
                              ElevatedButton(
                                onPressed: () async{
                                  print('Before $totalBalance');
                                 double depositedMoney = double.parse(depositMoneyController.text);
                                //   setState(() {
                                //      totalBalance += depositedMoney;
                                //   });
                                   await _accountService.addMoney(depositedMoney);
                                   await _loadBalance();
                                  print('After $totalBalance');
                                  Navigator.pop(context);
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


    // ignore: non_constant_identifier_names
    Future<dynamic> withdraw_money_model(BuildContext context, TextEditingController withdrawMoneyController) {
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
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: TextField(
                                        controller: withdrawMoneyController,
                                        style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 16, fontWeight: FontWeight.w200),
                                        keyboardType: TextInputType.numberWithOptions(),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          errorText: null,
                                          // helperStyle: 
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40,),
                              ElevatedButton(
                                onPressed: () async {
                                  double withdrawedMoney = double.parse(withdrawMoneyController.text);
                                  if(withdrawedMoney > totalBalance){
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                       SnackBar(
                                        content: Text('You have not enough money'),
                                        backgroundColor: Theme.of(context).cardColor
                                        ),
                                    );
                                    return;
                                  }
                                  print('Before $totalBalance');
                                  // setState(() {
                                  //    totalBalance -= withdrawedMoney;
                                  // });
                                   await _accountService.deductMoney(withdrawedMoney);
                                   await _loadBalance();

                                  print('After $totalBalance');
                                  Navigator.pop(context);
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
