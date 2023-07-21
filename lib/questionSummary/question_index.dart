import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questionSummary/question_identifier.dart';

class QuestionIndex extends StatelessWidget {
  const QuestionIndex(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(context) {
    final isCorrectAnswer =
        itemData['User Answer'] == itemData['Correct Answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrect: isCorrectAnswer,
            questionindex: itemData['Question index'] as int,
          ),
          const Padding(
            padding: EdgeInsets.all(10),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemData['Question'] as String,
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  itemData["User Answer"] as String,
                  style: GoogleFonts.lato(
                    color: isCorrectAnswer == true
                        ? const Color.fromARGB(255, 150, 198, 241)
                        : const Color.fromARGB(255, 249, 133, 241),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  itemData["Correct Answer"] as String,
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 153, 254, 232),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
