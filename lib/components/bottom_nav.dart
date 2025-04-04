import 'package:flutter/material.dart';


  



// class BottomNav extends StatelessWidget {
//   const BottomNav({super.key});
 
class BottomNav extends StatefulWidget{
   const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
      int currentIndex = 0;
    int selectedIndex = 0;

   @override
   void initState(){
     currentIndex;
     selectedIndex;
     super.initState();
   }

 @override
  Widget build(BuildContext context) {
    return Container(
     margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
    child: ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: BottomNavigationBar(
      currentIndex: selectedIndex,
      selectedItemColor: Colors.green,
      showUnselectedLabels: true,
      unselectedItemColor: Theme.of(context).hintColor,
      items: const <BottomNavigationBarItem> [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', ),
        BottomNavigationBarItem(icon: Icon(Icons.quiz_rounded), label: 'Quiz'),
        BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: 'ledaerBoard'),
        BottomNavigationBarItem(icon: Icon(Icons.supervised_user_circle_sharp), label: 'profile'),
      ],
      onTap: (selectedIndex){
          setState(() {
            currentIndex = selectedIndex;
          });
         print(currentIndex);
      },
      ),
  ),
    );
  }
}
