import 'package:flutter/material.dart';
import 'package:one_quiz/components/bottom_nav.dart';
import 'package:one_quiz/screen/app.dart';
import 'package:one_quiz/screen/home_screen.dart';
import 'package:one_quiz/screen/quiz_category.dart';
import 'package:one_quiz/theme/dark_theme.dart';
import 'package:one_quiz/theme/light_theme.dart';

void main() async {
   
   WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      // home: App(),
      // home: HomeScreen(),
      home: BottomNav(),
    );
  }
}