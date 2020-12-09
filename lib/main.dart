import 'package:flutter/material.dart';
import './quiz1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Multiple Choice Quiz', home: new AnimalQuiz());
  }
}

class AnimalQuiz extends StatefulWidget {
  @override
  createState() => new AnimalQuizState();
}

class AnimalQuizState extends State<AnimalQuiz> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Multiple Choice Quiz'),
        backgroundColor: Colors.lightBlue,
      ),
      body: new Container(
        margin: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              onPressed: () => StartQuiz(),
              color: Colors.blue,
              textColor: Colors.white,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(15.0),
                width: 400.0,
                child: Align(
                  alignment: Alignment.center,
                  child: const Text('Quiz 1', style: TextStyle(fontSize: 20)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Start Quiz method
  // ignore: non_constant_identifier_names
  void StartQuiz() {
    setState(() {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new Quiz1()));
    });
  }
}
