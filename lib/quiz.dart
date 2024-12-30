import 'question.dart';

// Quiz class to manage questions and scoring
class Quiz {
  final List<Question> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;

  Quiz(this._questions);

  String getCurrentQuestionText() {
    return _questions[_currentQuestionIndex].questionText;
  }

  List<String> getCurrentQuestionAnswers() {
    return _questions[_currentQuestionIndex].answers;
  }

  bool isCorrectAnswer(String answer) {
    return _questions[_currentQuestionIndex].correctAnswer == answer;
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
    }
  }

  bool isQuizFinished() {
    return _currentQuestionIndex >= _questions.length - 1;
  }

  void increaseScore() {
    _score++;
  }

  int getScore() {
    return _score;
  }

  int getTotalQuestions() {
    return _questions.length;
  }

  void reset() {
    _currentQuestionIndex = 0;
    _score = 0;
  }
}
