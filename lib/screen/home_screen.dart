// ignore_for_file: non_constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_quiz/components/bottom_nav.dart';
import 'package:one_quiz/components/input_cash.dart';
import 'package:one_quiz/model/category_model.dart';
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
  List<CategoryModel> categories = CategoryModel.initCategoryModel();

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
    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         const Spacer(),
    //         Center(child: Text('Total Balance: $totalBalance')),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             TextButton(
    //               onPressed: (){
    //                 deposit_money_model(context, depositMoneyController);
    //               }, 
    //               child: Text('Deposit')
    //               ),
    //             TextButton(
    //               onPressed: (){
    //                 withdraw_money_model(context, withdrawMoneyController);
    //               }, 
    //               child: Text('Withdraw')
    //               ),
    //           ],
    //         ),
    //         // const Spacer(),
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.only(left: 15),
    //               child: Text('Available questions', style: Theme.of(context).textTheme.labelSmall,),
    //             ),
    //             InkWell(
    //               onTap: (){
    //                 // Navigator.push(
    //                 //   context, 
    //                 //   MaterialPageRoute(
    //                 //     builder: (context) => App()
    //                 //     )
    //                 //   );
    //                showDialog(context: context, builder: (context){
    //                 return AlertDialog(
    //                   backgroundColor: Theme.of(context).cardColor,
    //                   scrollable: true,
    //                   content: Container(
    //                     height: screenHeight / 2,
    //                     width:  screenWidth,
    //                     margin: EdgeInsets.symmetric(horizontal: 8),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Center(
    //                           child: Text(
    //                             'Bet to claim your points',
    //                             style: Theme.of(context).textTheme.displayMedium,
    //                             )
    //                           ),
    //                           const SizedBox(height: 12,),
    //                           Text(
    //                             'Enter The money ', 
    //                             style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 15),
    //                             ),
    //                           const SizedBox(height: 8,),
    //                           inputCash(context, betMOneyController),
    //                           const SizedBox(height: 42,),
    //                           TextButton(
    //                             onPressed: () async{
    //                                double selectedMoney = double.parse(betMOneyController.text);
                                  
    //                                if(selectedMoney > totalBalance){
    //                                   Navigator.pop(context);
    //                                   ScaffoldMessenger.of(context).showSnackBar(
    //                                     SnackBar(
    //                                       content: Text('You have n\'t enough money'),                                          
    //                                       ),
    //                                   );
    //                                   return;
    //                                }
    //                                await _accountService.deductMoney(selectedMoney);
    //                                await _loadBalance();
    //                                Navigator.push(
    //                                 context, 
    //                                 MaterialPageRoute(
    //                                   builder: (context) => App()
    //                                   )
    //                                 );
    //                             }, 
    //                             child: Text('Start')
    //                             )
    //                       ],
    //                     ),
    //                   ),
    //                 );
    //                });
    //               },
    //               child: ListTile(
    //                 leading: Icon(Icons.question_answer_outlined),
    //                 title: Text(
    //                   'Mathematics', 
    //                   style: Theme.of(context).textTheme.labelSmall
    //                   !.copyWith(fontSize: 15),
    //                   ),
    //               ),
    //             ),
    //           ],
    //         ),
    //         const Spacer(),
    //         const Spacer(),
    //       ],
    //     ),
    //   ),
    // );
    

   return Scaffold(
    body: SingleChildScrollView(
      child: Container(
        height: screenHeight,
        width: screenWidth <= 450 ? screenWidth: screenWidth / 2,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        child: ClipOval(
                          child: Image.network(
                            'assets/profile.png',
                             fit: BoxFit.cover,
                            ),
                        ),
                      ),
                       const SizedBox(width: 12),
                      Text(
                        'QuizMaster',
                        style: Theme.of(context).textTheme.displayMedium
                        !.copyWith(fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                    ],
                  ),
                  IconButton(
                    onPressed: (){
                    },
                    icon:Icon(Icons.menu)
                    )
                ],
              ),
            ),
            const SizedBox(height: 42,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Account', 
                    style: Theme.of(context).textTheme.displaySmall
                    !.copyWith(fontSize: 19, fontWeight: FontWeight.w600),
                    ),
                ),
                const SizedBox(height: 12),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  padding: EdgeInsets.symmetric(vertical: 22, horizontal: 12),
                  height: screenHeight / 4,
                  width: screenWidth <= 450 ? screenWidth : screenWidth / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      // tileMode: TileMode.clamp,
                      colors: ThemeMode.light == true 
                      ? 
                      <Color>[
                       const Color.fromARGB(255, 5, 19, 6).withOpacity(0.7),
                       const Color.fromARGB(255, 5, 19, 6).withOpacity(0.9),
                       const Color.fromARGB(255, 5, 19, 6).withOpacity(0.8),
                      ]
                      : <Color> [
                        const Color.fromARGB(255, 12, 46, 24).withOpacity(0.7),
                        const Color.fromARGB(255, 12, 46, 24).withOpacity(0.9),
                        const Color.fromARGB(255, 12, 46, 24).withOpacity(0.8),
                      ]
                      )
                  ), 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 42,
                            // width: 100,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              color: Theme.of(context).cardColor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                      backgroundColor: Theme.of(context).cardColor,
                                      child: ClipOval(
                                        child: Image.network(
                                          'assets/rwanda.png',
                                          fit: BoxFit.cover,
                                          ),
                            
                                        ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text('Rwanda')
                              ],
                              ),
                          ),
                          Text(
                            "Mtn", 
                            style: Theme.of(context).textTheme.displaySmall
                            !.copyWith(color: Colors.white, fontSize: 20,),
                            )
                        ],
                      ),
                      const SizedBox(height: 12,),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '$totalBalance\t',
                                style: Theme.of(context).textTheme.displayMedium
                                !.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white
                                  ), 
                              ),
                              TextSpan(
                                text: 'frw',
                                style: Theme.of(context).textTheme.displaySmall
                                !.copyWith(color: Colors.white, fontSize: 20,),
                              )
                            ]
                          )
                          ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: (){
                              deposit_money_model(context, depositMoneyController);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text('deposit'),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: (){
                              withdraw_money_model(context, withdrawMoneyController);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text('withdraw'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ), 
                ),
                const SizedBox(height: 12),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: Theme.of(context).textTheme.displaySmall
                        !.copyWith(fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 12,),
                        Container(
                          height: screenHeight / 4,
                          child: ListView.builder(
                            itemCount: categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, index){
                             return Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              width: screenWidth <= 450 ? screenWidth / 1.5: screenWidth /2,
                               child: Card(
                                color: Theme.of(context).cardColor,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 12),
                                      child: Text(categories[index].ill, 
                                      style: Theme.of(context).textTheme.labelMedium
                                           !.copyWith(fontSize: 18)
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        const SizedBox(height: 18,),
                                        Text(
                                          categories[index].name,
                                          style: Theme.of(context).textTheme.displaySmall,
                                          ),
                                        const SizedBox(height: 8,),
                                        Text(
                                          "${categories[index].detail} questions",
                                          style: Theme.of(context).textTheme.labelSmall,
                                        ), 
                                        const SizedBox(height: 22, width: 10,),
                                        Center(
                                          child: InkWell(
                                            onTap: (){},
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 8),
                                              // margin: const EdgeInsets.only(bottom: 12),
                                              decoration: BoxDecoration(
                                                 color: categories[index].color2,
                                                borderRadius: BorderRadius.circular(18),
                                               ),
                                               child: Text(
                                                'Play', 
                                                style: TextStyle(
                                                  color: categories[index].color1,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700
                                                ),
                                                ),
                                              ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                 ),
                               ),
                             );
                            },
                            ),
                        )
                    ],
                  ),
                )  
              ],
            )
          ],
        ),
      ),
    ),
    // bottomNavigationBar: BottomNav(),
   );
  }


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
                                    // Icon(Icons.leaderboard_rounded),
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
