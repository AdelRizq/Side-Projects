import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetHandler;

  Result(this.totalScore, this.resetHandler);

  String get resultPhrase {
    String resultText = "You did it ya bro ❤";
    if (totalScore >= 5)
      resultText = "You are a dragon! 🐲\nScore: ${totalScore}";
    else
      resultText = "Btngana 😜‍\nScore: ${totalScore}";

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
            child: Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  resultPhrase,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ))),
        RaisedButton(
          child: Text("Restart!"),
          color: (resultPhrase.contains("dragon")
              ? Colors.greenAccent[400]
              : Colors.red[800]),
          onPressed: resetHandler,
        )
      ],
    );
  }
}
