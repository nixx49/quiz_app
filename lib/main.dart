import 'package:flutter/material.dart';

import 'package:quiz_app/questionbrain.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        // questionDisplay(),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: QuestionBrain().getQuestionText(),
                        // .questionBank[questionNumber]
                        // .questionText,
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              onPressed: () {
                //The user picked true.
                setState(() {
                  // scoreKeeper.add(const Icon(
                  //   Icons.check_circle_outline,
                  //   color: Colors.green,
                  // ));
                  QuestionBrain().nextQuestion();
                  bool correctAnswer = QuestionBrain().getCorrectAnswer();
                  // .questionAnswer;

                  if (correctAnswer == true) {
                    print('your answer is correct');
                  } else {
                    print('your answer is wrong');
                  }
                });
              },
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              onPressed: () {
                setState(() {
                  QuestionBrain().nextQuestion();
                  bool correctAnswer = QuestionBrain().getCorrectAnswer();

                  if (correctAnswer == false) {
                    print('your answer is correct');
                  } else {
                    print('your answer is wrong');
                  }
                });
                //The user picked false.
              },
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        Row(
          children: scoreKeeper,
        ),
        const SizedBox(
          height: 20,
        ),

        // Add a Row here as your score keeper
      ],
    );
  }
}
