// questuion.dart

import 'package:companion/pages/home.dart';
import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Text(
            questionText,
            style: const TextStyle(fontSize: 23),
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answerText;
  final VoidCallback onPressed;

  AnswerButton(this.answerText, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(answerText),
        ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final dynamic questions;
  final dynamic questionIndex;
  final dynamic answerQuestion;

  Quiz({
     this.questions,
     this.questionIndex,
     this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as dynamic,
        ),
        ...((questions[questionIndex]['answers'] as dynamic)
            .map((answer) {
          return AnswerButton(
            answer['text'] as String,
                () => answerQuestion(answer['score'] as dynamic),
          );
        }).toList()),
      ],
    );
  }
}

// answer.dart

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        onPressed: selectHandler,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(93, 63, 211, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          answerText,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

// quiz.dart



class Quiz1 extends StatelessWidget {
  final dynamic questions;
  final dynamic questionIndex;
  final dynamic answerQuestion;

  Quiz1({
     this.questions,
     this.answerQuestion,
     this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'] as dynamic,
        ),
        ...(questions[questionIndex]['answers'] as dynamic)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score'] as dynamic),
              answer['text'] as String);
        }).toList()
      ],
    );
  }
}

// result.dart
class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 4) {
      resultText =
      'Your results indicate that you have none, or very few signs of depression. \n\n\nThese results are not meant to be a diagnosis. You can meet with a doctor or therapist to get a diagnosis and/or access therapy or medications. Sharing these results with someone you trust can be a great place to start.';
    } else if (resultScore <= 9) {
      resultText =
      'Your results indicate that you may be experiencing mild depression. \n\n\nThese results are not meant to be a diagnosis. You can meet with a doctor or therapist to get a diagnosis and/or access therapy or medications. Sharing these results with someone you trust can be a great place to start.';
    } else if (resultScore <= 14) {
      resultText =
      'Your results indicate that you are experiencing moderate depression. \n\n\nThese results are not meant to be a diagnosis. You can meet with a doctor or therapist to get a diagnosis and/or access therapy or medications. Sharing these results with someone you trust can be a great place to start.';
    } else if (resultScore <= 19) {
      resultText =
      'Your results indicate that you may be experiencing severe depression. \n\n\nThese results are not meant to be a diagnosis. You can meet with a doctor or therapist to get a diagnosis and/or access therapy or medications. Sharing these results with someone you trust can be a great place to start.';
    } else {
      resultText =
      'Your results indicate that you may be at risk for major depression. \n\n\nThese results are not meant to be a diagnosis. You can meet with a doctor or therapist to get a diagnosis and/or access therapy or medications. Sharing these results with someone you trust can be a great place to start.';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  resultPhrase,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ElevatedButton(
            child: Text(
              'Home Page',
              style: TextStyle(fontSize: 18),
            ),
          onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  Home()),);
          },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(93, 63, 211, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

//main.dart

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Little interest or pleasure in doing things?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText': 'Feeling down, depressed, or hopeless?',
      'answers': [
        {'text': '    NOT AT ALL  ', 'score': 0},
        {'text': '   SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': ' NEARLY EVERY DAY ', 'score': 3},
      ],
    },
    {
      'questionText':
      'Trouble falling or staying asleep, or sleeping too much?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText': 'Feeling tired or having little energy?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText': 'Poor appetite or overeating?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Feeling bad about yourself - or that you are a failure or have let yourself or your family down?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Trouble concentrating on things, such as reading the newspaper or watching television?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Moving or speaking so slowly that other people could have noticed or the opposite - being so fidgety or restless that you have been moving around a lot more than usual?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'Thoughts that you would be better off dead, or of hurting yourself?',
      'answers': [
        {'text': 'NOT AT ALL', 'score': 0},
        {'text': 'SEVERAL DAYS', 'score': 1},
        {'text': 'MORE THAN HALF THE DAYS', 'score': 2},
        {'text': 'NEARLY EVERY DAY', 'score': 3},
      ],
    },
    {
      'questionText':
      'If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?',
      'answers': [
        {'text': 'NOT DIFFICULT AT ALL', 'score': 0},
        {'text': 'SOMEWHAT DIFFICULT', 'score': 1},
        {'text': 'VERY DIFFICULT', 'score': 2},
        {'text': 'EXTREMELY DIFFICULT', 'score': 3},
      ],
    }
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
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
      print("Total score: $_totalScore");
    } else {
      print('No more questions!');
      print("Total score: $_totalScore");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Depression Test'),
          backgroundColor: Color.fromRGBO(93, 63, 211, 1),
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