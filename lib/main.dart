import 'package:flutter/material.dart';
import 'package:hangman_flutter/Provider/WordProvider.dart';
import 'package:hangman_flutter/screens/main_ui/StartScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => WordProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hangman',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartScreen(),
    );
  }
}
