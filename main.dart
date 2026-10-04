import 'package:flutter/material.dart';

void main() {
  runApp(KadiKakutakTimor());
}

class KadiKakutakTimor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kadi Kakutak Istória Timor',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Iha tinan hira mak Timor-Leste proklama ninia independénsia?',
      'answers': [
        {'text': '1975', 'score': 1},
        {'text': '1999', 'score': 0},
        {'text': '2002', 'score': 0},
        {'text': '1980', 'score': 0},
      ],
    },
    {
      'questionText': 'Sé mak Primeiru-Ministru primeiru Timor-Leste nian?',
      'answers': [
        {'text': 'Kay Rala Xanana Gusmão', 'score': 0},
        {'text': 'Mari Alkatiri', 'score': 1},
        {'text': 'José Ramos Horta', 'score': 0},
        {'text': 'Francisco Guterres', 'score': 0},
      ],
    },
    {
      'questionText': 'Iha tinan hira mak Timor-Leste restaura ninia independénsia?',
      'answers': [
        {'text': '1999', 'score': 0},
        {'text': '2000', 'score': 0},
        {'text': '2002', 'score': 1},
        {'text': '2001', 'score': 0},
      ],
    },
    {
      'questionText': 'Sé mak Prezidente Repúblika primeiru Timor-Leste nian?',
      'answers': [
        {'text': 'Xanana Gusmão', 'score': 1},
        {'text': 'José Ramos Horta', 'score': 0},
        {'text': ' Taur Matan Kon', 'score': 0},
        {'text': 'Mari Alkatiri', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Kadi Kakutak: Istória Timor'),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _questionIndex < _questions.length
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Kestaun ${_questionIndex + 1}/${_questions.length}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    _questions[_questionIndex]['questionText'] as String,
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ...(_questions[_questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[700],
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () => _answerQuestion(answer['score'] as int),
                        child: Text(answer['text'] as String),
                      ),
                    );
                  }).toList(),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rezultadu Finál',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ita-boot hetan pontu: $_totalScore / ${_questions.length}',
                      style: TextStyle(fontSize: 24),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _resetQuiz,
                      child: Text('Hahú Fali'),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
