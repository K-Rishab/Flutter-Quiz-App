import 'package:flutter/material.dart';
import 'package:quiz_app/options.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.selectedAnswer});
  final void Function(String answer) selectedAnswer;
  @override
  State<Question> createState() {
    return _Question();
  }
}

class _Question extends State<Question> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answerSelected) {
    widget.selectedAnswer(
        answerSelected); //widget. allow a function to use in state class
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity, // it takes maximum screen according to the device
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // for vertical
          crossAxisAlignment: CrossAxisAlignment.stretch, // for horizontal
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.alice(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // .map type cast the list into list widget
            ...currentQuestion.shuffledAnswer.map(
              (item) {
                return Options(
                  choice: item,
                  onTap: () {
                    answerQuestion(item);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
