import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result({this.resultScore, this.resetHandler});

  String get resultPhrase {
    var resultText = 'You did it ' + resultScore.toString();
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: resetHandler,
            child: Text('Resart Quiz'),
          )
        ],
      ),
    );
  }
}
