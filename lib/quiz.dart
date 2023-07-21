import 'package:flutter/material.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_Screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _Quiz();
  }
}

class _Quiz extends State<Quiz> {
  List<String> answerChoosen = [];
  var currentScreen = 'StartScreen';
  void switchScreen() {
    setState(() {
      currentScreen = "Question";
    });
  }

  void chooseAnswer(String answer) {
    answerChoosen.add(answer);
    if (answerChoosen.length == questions.length) {
      setState(() {
        currentScreen = "ResultScreen";
      });
    }
  }

  void restartQuiz() {
    setState(() {
      currentScreen = "StartScreen";
      answerChoosen = [];
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (currentScreen == "Question") {
      screenWidget = Question(selectedAnswer: chooseAnswer);
    }
    if (currentScreen == "ResultScreen") {
      screenWidget = ResultScreen(
        chosenAnswer: answerChoosen,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(161, 107, 45, 206),
                Color.fromARGB(255, 115, 23, 202),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
