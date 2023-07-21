class QuizQuestions {
  const QuizQuestions(this.text, this.answer);
  final String text;
  final List<String> answer;

  List<String> get shuffledAnswer {
    final shuffledList = List.of(answer); // coppy the list of answer
    shuffledList.shuffle();
    return shuffledList;
  }
}
