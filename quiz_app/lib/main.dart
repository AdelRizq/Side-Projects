import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questions = [
    {
      'questionText': 'What\'s your favourite online judge ?',
      'answers': [
        {'text': 'Codeforces', 'score': 4},
        {'text': 'Vjudge', 'score': 3},
        {'text': 'Spoj', 'score': 2},
        {'text': 'UVA', 'score': 1},
      ],
    },
    {
      'questionText': 'what\'s your favourite warrior in brawlhalla ?',
      'answers': [
        {'text': 'Xull', 'score': 1},
        {'text': 'Adel', 'score': 2},
        {'text': 'Dedo', 'score': 3},
        {'text': 'Dandosh', 'score': 4},
      ],
    }
  ];

  int _questionIndex = 0, _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dandosh quiz app"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
