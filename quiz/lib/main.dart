import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite Game',
      'answers': [
        {'text': 'Apex Legend', 'score': 10},
        {'text': 'NFS MW', 'score': 5},
        {'text': 'Far Cry', 'score': 3},
        {'text': 'COD', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favorite city?',
      'answers': [
        {'text': 'Delhi', 'score': 3},
        {'text': 'Mumbai', 'score': 11},
        {'text': 'Chandigharh', 'score': 5},
        {'text': 'Lucknow', 'score': 9},
      ],
    },
    {
      'questionText': 'Who\'s your favorite Player?',
      'answers': [
        {'text': 'Sachin', 'score': 1},
        {'text': 'Sania Mirza', 'score': 1},
        {'text': 'Sania Nehwal', 'score': 1},
        {'text': 'Virat Kohli', 'score': 1},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // var aBool = true;
    // aBool = false;

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }
  void _previousbutton(){
    setState(() {
      if (_questionIndex<1) {
        return;
      }
      _questionIndex--;
    });
  }

  void _nextbutton(){
    setState(() {
      _questionIndex++;
    });
  }



  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: _previousbutton,
                tooltip: 'Back',
                child: const Icon(Icons.arrow_left),
              ),
              FloatingActionButton(
                onPressed: _nextbutton,
                tooltip: 'Skip',
                child: const Icon(Icons.arrow_right),
              )
            ],
          ),
      ),
    );
  }
}
