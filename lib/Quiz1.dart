import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimalQuiz {
  var images = ["alligator", "cat", "dog", "owl"];

  var questions = [
    "This animal is a carnivorous reptile. ",
    "________ like to chase mice and birds",
    "Give a ________ a bone and it will fine it's way home",
    "A nocturnal animal with some big eyes"
  ];
}

class Quiz1 extends StatefulWidget {
  @override
  createState() => new Quiz1State();
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        body: new Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[
              new Padding(padding: EdgeInsets.all(20.0)),
              new Text('Hello Welcome')
            ],
          ),
        ),
      ),
    );
  }
}
