import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 0.1,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: ClipOval(
          child: BottomNavigationBar(
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              const BottomNavigationBarItem(icon: Icon(Icons.quiz_rounded), label: 'Play Quiz'),
              const BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'ledaerBoard'),
              const BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_sharp), label: 'profile'),
            ]
            ),
        ),
      ),
    );
  }
}