// Question class to hold question and its answers
class Question {
  final String questionText;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.questionText,
    required this.answers,
    required this.correctAnswer,
  });
}
