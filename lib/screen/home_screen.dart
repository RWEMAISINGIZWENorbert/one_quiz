import 'package:flutter/material.dart';
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
  //     double depositedMoney  = double.parse(depositMoneyController.text);
  //  void _depositMoney(){
  //   setState(() {
  //     totalBalance += depositedMoney;
  //   });
  //  }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text('Total Balance: $totalBalance'),
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
            const Spacer(),
            const Spacer()
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
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 12),
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).scaffoldBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)
                                      ),
                                      child: TextField(
                                        controller: depositMoneyController,
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
                                onPressed: (){
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
                                  setState(() {
                                     totalBalance -= withdrawedMoney;
                                  });
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
