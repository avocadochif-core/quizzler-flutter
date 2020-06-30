import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzler/question.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light));

  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Quizzler(),
        ),
      ),
    ),
  );
}

class Quizzler extends StatefulWidget {
  @override
  _QuizzlerState createState() => _QuizzlerState();
}

class _QuizzlerState extends State<Quizzler> {
  List<Widget> score = [];

  List<Question> questions = [
    Question('question 0', false),
    Question('question 1', true),
    Question('question 2', true),
    Question('question 3', false)
  ];

  int questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  questions[questionIndex].question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (questions[questionIndex].answer == true) {
                      score.add(
                        Expanded(
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        ),
                      );
                    } else {
                      score.add(
                        Expanded(
                          child: Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                    questionIndex = (questions.length + questionIndex + 1) % questions.length;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                color: Colors.red,
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    if (questions[questionIndex].answer == false) {
                      score.add(
                        Expanded(
                          child: Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        ),
                      );
                    } else {
                      score.add(
                        Expanded(
                          child: Icon(
                            Icons.clear,
                            color: Colors.red,
                          ),
                        ),
                      );
                    }
                    questionIndex = (questions.length + questionIndex + 1) % questions.length;
                  });
                },
              ),
            ),
          ),
          Row(
            children: score,
          ),
        ],
      ),
    );
  }
}
