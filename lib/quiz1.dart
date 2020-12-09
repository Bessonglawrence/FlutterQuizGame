import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimalQuiz {
  var images = ["alligator", "cat", "dog", "Owl"];

  var questions = [
    "This animal is a carnivorous reptile. ",
    "________ like to chase mice and birds",
    "Give a ________ a bone and it will fine it's way home",
    "A nocturnal animal with some big eyes"
  ];

  var choices = [
    ["Cat", "Cheep", "Alligator", "Cow"],
    ["Cat", "Slug", "Snail", "Mouse"],
    ["Mouse", "Dog", "Elephant", "Donkey"],
    ["Spider", "Snake", "Hawk", "Owl"],
  ];

  var correctAnsweres = ["Alligator", "Cat", "Dog", "Owl"];
}

var finalScore = 0;
var questionNumber = 0;
var quiz = new AnimalQuiz();

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

              new Container(
                alignment: Alignment.centerRight,
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "Question ${questionNumber + 1} of ${quiz.questions.length}",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new Text(
                      "Score $finalScore",
                      style: new TextStyle(fontSize: 22.0),
                    )
                  ],
                ),
              ),

              // Image
              new Padding(
                padding: EdgeInsets.all(10.0),
              ),

              new Image.asset(
                "images/${quiz.images[questionNumber]}.jpg",
                height: 200.0,
              ),

              new Padding(padding: EdgeInsets.all(10.0)),
              new Text(
                quiz.questions[questionNumber],
                style: new TextStyle(fontSize: 18.0),
              ),

              new Padding(padding: EdgeInsets.all(10.0)),

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Button 1
                  new MaterialButton(
                    minWidth: 160.0,
                    color: Colors.blue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][0] ==
                          quiz.correctAnsweres[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                  ),

                  //Button 2
                  new MaterialButton(
                    minWidth: 160.0,
                    color: Colors.blue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][1] ==
                          quiz.correctAnsweres[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                  )
                ],
              ),

              //Row 2
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //Button 3
                  new MaterialButton(
                    minWidth: 160.0,
                    color: Colors.blue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][2] ==
                          quiz.correctAnsweres[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(quiz.choices[questionNumber][2],
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                  ),

                  //Button 4
                  new MaterialButton(
                    minWidth: 160.0,
                    color: Colors.blue,
                    onPressed: () {
                      if (quiz.choices[questionNumber][3] ==
                          quiz.correctAnsweres[questionNumber]) {
                        debugPrint("Correct");
                        finalScore++;
                      } else {
                        debugPrint("Wrong");
                      }
                      updateQuestion();
                    },
                    child: new Text(quiz.choices[questionNumber][3],
                        style: new TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        )),
                  )
                ],
              ),

              new Container(
                  alignment: Alignment.bottomCenter,
                  child: new MaterialButton(
                    minWidth: 240.0,
                    color: Colors.red,
                    height: 43.0,
                    onPressed: resetQuiz,
                    child: new Text(
                      'Quit',
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void resetQuiz() {
    setState(() {
      Navigator.pop(context);
      finalScore = 0;
      questionNumber = 0;
    });
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(score: finalScore)));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        body: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Final Score : $score",
                style: new TextStyle(
                  fontSize: 25.0,
                  color: Colors.green,
                ),
              ),
              new Padding(padding: EdgeInsets.all(10.0)),
              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                },
                child: new Text(
                  'Reset Quiz',
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
