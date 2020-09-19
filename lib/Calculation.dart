import 'dart:math';

class Calculation {
  Calculation({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String bmiCalculation() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher weight than the normal body weight.Try to lose some of it.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight.Keep it up.';
    } else {
      return 'You are lower than the required body weight.Try to gain some.';
    }
  }
}
