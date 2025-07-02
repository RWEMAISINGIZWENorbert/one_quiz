import 'package:flutter/material.dart';
import 'package:one_quiz/components/input_text_1.dart';


Future<dynamic> add_product(
         BuildContext context, 
        //  depositMoneyController
        //  totalBalance,
        //  depositMoney
         ) {
    return showModalBottomSheet(
                 context: context, 
                    builder: (context){
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: Container(
                          color: Theme.of(context).cardColor,
                          // color: Theme.of(context).hintColor,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                                   padding: const EdgeInsets.symmetric(horizontal: 12),
                                   child: Text('Add New Product', style: Theme.of(context).textTheme.titleSmall,),
                                 ),
                                 const SizedBox(height: 14,),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 22, horizontal: 26),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Product name'),
                                        const SizedBox(height: 6,),
                                        const InputTextField(labelText: '', hintText: 'product name'),
                                        const SizedBox(height: 8,),
                                        Text('Purchase method'),
                                        const SizedBox(height: 6,),
                                        const InputTextField(labelText: '', hintText: 'purchase method e.g unit, packet'),
                                        const SizedBox(height: 8,),
                                        Text('sale method'),
                                        const SizedBox(height: 6,),
                                        const InputTextField(labelText: '', hintText: 'sale method e.g unit, packet'),
                                        const SizedBox(height: 8,),
                                        Text('cost per paket in rwf'),
                                        const SizedBox(height: 6,),
                                        const InputTextField(labelText: '', hintText: 'enter the cost per packet e.g 1200'),
                                        const SizedBox(height: 8,),
                                        Text('cost per unit in rwf'),
                                        const SizedBox(height: 6,),
                                        const InputTextField(labelText: '', hintText: 'enter the cost per unit e.g 200'),
                                        const SizedBox(height: 8,),
                                        Text('price per packet in rwf'),
                                        const SizedBox(height: 6,),
                                        const InputTextField(labelText: '', hintText: 'price per packet in rwf'),
                                        const SizedBox(height: 8,),
                                        Text('price per unit in rwf'),
                                        const SizedBox(height: 6,),
                                        const InputTextField(labelText: '', hintText: 'price per unit in rwf e.g 200'),
                                        const SizedBox(height: 8,),
                                        Text('size of packet'),
                                        const SizedBox(height: 6,),
                                        const InputTextField(labelText: '', hintText: 'Enter the units in one packet e.g 12'),
                                        const SizedBox(height: 8,),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40,),
                                // ElevatedButton(
                                //   onPressed: (){
                                //     print('Before $totalBalance');
                                //    double depositedMoney = double.parse(depositMoneyController.text);
                                //     // setState(() {
                                //     //    totalBalance += depositedMoney;
                                //     // });
                                //     depositMoney;
                                //     print('After $totalBalance');
                                //     Navigator.pop(context);
                                //   }, 
                                //   child: Text('submit')
                                //   )
                              ],
                            ),
                          ),
                        )
                        );
                    }
                    );
  }