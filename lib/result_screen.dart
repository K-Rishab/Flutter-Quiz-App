import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questionSummary/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.restart,
  });
  final List<String> chosenAnswer;
  final void Function() restart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    // now summary can be used as a variable with the help of get keyword
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'Question index': i,
          'Question': questions[i].text,
          'User Answer': chosenAnswer[i],
          'Correct Answer': questions[i].answer[0],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final correctAnswer = summaryData
        .where(
          (data) => data['User Answer'] == data['Correct Answer'],
        )
        .length;
    final totalQuestion = questions.length;
    return SizedBox(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $correctAnswer out of $totalQuestion question correctly!",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              onPressed: restart,
              icon: const Icon(
                Icons.rotate_left_outlined,
                size: 25,
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: Text(
                "Restart Quiz!",
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
