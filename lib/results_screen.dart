import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/first_screen.dart';
import 'package:quiz/questions_summary.dart';
import 'package:quiz/quiz.dart';
import 'data/questions.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.choosenAnswers, required this.restartQuiz});

  final List<String> choosenAnswers;

  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i<choosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              QuestionsSummary(summaryData),
              SizedBox(height: 30,),
              TextButton.icon(
                  onPressed: restartQuiz,
                  label: Text("Restart Quiz!", style: TextStyle(color: Colors.white),),
                  icon: Icon(Icons.restart_alt_outlined, color: Colors.white,),
              )
            ],
          ),
        ),
    );
  }
}
