import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'This is your first question?',
      'answers': [
        {'Text': 'Black', 'Score': 5},
        {'Text': 'Yellow', 'Score': 0},
        {'Text': 'Green', 'Score': 1},
        {'Text': 'Blue', 'Score': 10}
      ]
    },
    {
      'questionText': 'This is your first Pet?',
      'answers': [
        {'Text': 'Cat', 'Score': 0},
        {'Text': 'Dog', 'Score': 3},
        {'Text': 'Elephant', 'Score': 10},
        {'Text': 'Dinosaur', 'Score': 9}
      ]
    },
    {
      'questionText': 'This is your first Car?',
      'answers': [
        {'Text': 'Bus', 'Score': 3},
        {'Text': 'Ciaz', 'Score': 9},
        {'Text': 'Dodge', 'Score': 5},
        {'Text': 'Honda', 'Score': 6}
      ]
    },
  ];
  var _questionIndex = 0;
  int _totalScore = 0;
  void _resetQuestion() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print('answer chosen');
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex)
            : Result(
                resultScore: _totalScore,
                resetHandler: _resetQuestion,
              ),
      ),
    );
  }
}
