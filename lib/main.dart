import 'package:flutter/material.dart';

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
  List<Icon> scoreKeeper = [
    // const Icon(
    //   Icons.check_circle_outline,
    //   color: Colors.green,
    // ),
  ];

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];

  int questionNumber = 0;

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
                        text: questions[questionNumber],
                        style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ),
            // questions[questionNumber],
            // child: Text(
            //   'This is where the question text will go.',
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 25.0,
            //     color: Colors.white,
            //   ),
            // ),
            // ),
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
                  questionNumber++;
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
                  backgroundColor: MaterialStateProperty.all(Colors.orange)),
              onPressed: () {
                setState(() {
                  questionNumber++;
                });
                //The user picked maybe.
              },
              child: const Text(
                'Maybe',
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
                  questionNumber++;
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

//   questionDisplay() {
//     Text.rich(TextSpan(
//       children: <TextSpan>[
//         TextSpan(
//           text: questions[questionNumber], style: const TextStyle(fontSize: 25,color: Colors.white),
//         ),
//       ],
//     ));
//   }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
