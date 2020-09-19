import 'reusablecard.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiRes,
    @required this.interpretation,
    @required this.resultText,
    this.icons,
  });
  final String bmiRes;
  final String resultText;
  final String interpretation;
  final IconData icons;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 30.0),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: Color(0xFF1D1E33),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Icon(
                      icons,
                      size: 30.0,
                    ),
                    Text(
                      resultText.toUpperCase(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      bmiRes,
                      style: TextStyle(
                        fontSize: 100,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CalculateButton(
              onPressed: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE YOUR BMI',
            ),
          ],
        ),
      ),
    );
  }
}
