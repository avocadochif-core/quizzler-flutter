import 'package:quizzler/question.dart';

class QuizManager {
  int _questionIndex = 0;

  List<Question> _questions = [
    Question('question 0', false),
    Question('question 1', true),
    Question('question 2', true),
    Question('question 3', false)
  ];

  String getNextQuestion() {
    return _questions[_questionIndex].question;
  }

  bool checkAnswer(bool answer) {
    int index = _questionIndex;
    _questionIndex = (_questions.length + _questionIndex + 1) % _questions.length;
    return answer == _questions[index].answer;
  }
}
