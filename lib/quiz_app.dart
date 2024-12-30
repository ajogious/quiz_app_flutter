import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:quiz_app/quiz.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  late Quiz quiz;

  @override
  void initState() {
    super.initState();
    quiz = Quiz([
      Question(
        questionText: 'What is Flutter?',
        answers: ['A bird', 'A programming language', 'A framework', 'An IDE'],
        correctAnswer: 'A framework',
      ),
      Question(
        questionText: 'Who developed Flutter?',
        answers: ['Apple', 'Google', 'Facebook', 'Microsoft'],
        correctAnswer: 'Google',
      ),
      Question(
        questionText: 'What language does Flutter use?',
        answers: ['Java', 'Kotlin', 'Dart', 'Swift'],
        correctAnswer: 'Dart',
      ),
      Question(
        questionText: 'Which platform does Flutter support?',
        answers: ['iOS', 'Android', 'Web', 'All of the above'],
        correctAnswer: 'All of the above',
      ),
      Question(
        questionText: 'Which widget is used for layout in Flutter?',
        answers: ['Text', 'Container', 'Column', 'All of the above'],
        correctAnswer: 'All of the above',
      ),
    ]);
  }

  void answerQuestion(String answer) {
    setState(() {
      if (quiz.isCorrectAnswer(answer)) {
        quiz.increaseScore();
      }
      quiz.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFf0f4f8), // Light background color
        appBar: AppBar(
          title: const Text(
            'My Quiz App',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xFF00695c), // Teal color for AppBar
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: quiz.isQuizFinished()
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Quiz Finished!',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00695c),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your score: ${quiz.getScore()}/${quiz.getTotalQuestions()}',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            quiz.reset();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          backgroundColor: const Color(0xFF00695c),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Restart Quiz',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Text(
                        quiz.getCurrentQuestionText(),
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ...quiz.getCurrentQuestionAnswers().map((answer) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => answerQuestion(answer),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF00695c),
                            side: const BorderSide(
                                color: Color(0xFF00695c), width: 2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            answer,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
        ),
      ),
    );
  }
}
