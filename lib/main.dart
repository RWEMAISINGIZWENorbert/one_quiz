import 'package:flutter/material.dart';
import 'package:one_quiz/screen/app.dart';
import 'package:one_quiz/theme/dark_theme.dart';
import 'package:one_quiz/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.dark,
      home: App(),
    );
  }
}