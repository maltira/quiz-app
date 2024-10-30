import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 300,
                height: 300,
                color: Colors.white,
            ),
            const SizedBox(height: 80,),
            Text(
                "Hello",
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                  )
                )
            ),
            const SizedBox(height: 30,),
            OutlinedButton.icon(
              onPressed: startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white
              ),
              icon: const Icon(Icons.arrow_right_alt),
              label: Text(
                  'Start Quiz',
              ),
            )
          ],
        ),
    );
  }
}
