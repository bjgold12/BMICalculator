import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  CalculateButton({@required this.onPressed, @required this.buttonTitle});

  final Function onPressed;
  final String buttonTitle;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.pinkAccent,
        ),
        margin:
            EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
        width: double.infinity,
        height: 50.0,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 25.0,
            ),
          ),
        ),
      ),
    );
  }
}
