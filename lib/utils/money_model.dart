import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Future<dynamic> deposit_money_model(
         BuildContext context, 
         TextEditingController depositMoneyController, 
         totalBalance,
         depositMoney) {
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
                                onPressed: (){
                                  print('Before $totalBalance');
                                 double depositedMoney = double.parse(depositMoneyController.text);
                                  // setState(() {
                                  //    totalBalance += depositedMoney;
                                  // });
                                  depositMoney;
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