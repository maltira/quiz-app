import 'package:flutter/material.dart';
import 'package:quiz/question_screens.dart';
import 'package:quiz/results_screen.dart';

import 'data/questions.dart';
import 'first_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];

  Widget? activeScreen;

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(choosenAnswers: selectedAnswers, restartQuiz: restartQuiz,);
        selectedAnswers = [];
      });
    }
  }

  @override
  void initState() {
    activeScreen = FirstScreen(switchScreens);
    super.initState();
  }

  void restartQuiz(){
    setState(() {
      activeScreen = FirstScreen(switchScreens);
    });
  }

  void switchScreens(){
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.deepPurple.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                )
            ),
            child: activeScreen
        ),
      ),
    );
  }
}
