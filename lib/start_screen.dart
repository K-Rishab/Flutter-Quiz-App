import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 280,
            color: const Color.fromARGB(186, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter in a fun way !",
            style: GoogleFonts.alice(
              color: const Color.fromARGB(255, 246, 234, 254),
              fontSize: 26,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.keyboard_double_arrow_right_rounded),
            label: const Text(
              "Start Quiz",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
