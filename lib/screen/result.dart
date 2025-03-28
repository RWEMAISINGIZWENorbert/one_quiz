
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MyResult extends StatelessWidget {
  const MyResult({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
                radius:  100,
                lineWidth: 2.0,
                percent: ((4 * 100) / 5) / 100,
                center:  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Passed',
                      style: Theme.of(context).textTheme.labelSmall,
                      ),
                  ],
                ),
                progressColor: Colors.amber[700],
                ),
                const SizedBox(height: 20),
                Text('4 out of 15', style: Theme.of(context).textTheme.labelSmall,)
            ],
          ),
        ),
      ),
    );
  }
}