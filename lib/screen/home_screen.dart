import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
      int totalBalance = 2000;
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
                    showModalBottomSheet(
                      context: context, 
                      builder: (context){
                        return SizedBox(
                          height: 700,
                          child: Container(
                            color: Theme.of(context).cardColor,
                            child: Container(
                              height: 24,
                              decoration: BoxDecoration(
                                color: Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(8)
                              ),
                            ),
                          )
                          );
                      }
                      );
                  }, 
                  child: Text('Deposit')
                  ),
                TextButton(
                  onPressed: (){}, 
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
}