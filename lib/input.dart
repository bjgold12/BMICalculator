import 'icon_card.dart';
import 'reusablecard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results.dart';
import 'button.dart';
import 'roundiconbutton.dart';
import 'Calculation.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFF1D1E33);

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  IconData iconMf;//TODO:Icons
  Gender selectedGender;
  int weight = 60;
  int height = 180;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.Male;
                        iconMf=FontAwesomeIcons.mars;//TODO:icons
                      });
                    },
                    colour: selectedGender == Gender.Male
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild:
                        IconCards(icon: FontAwesomeIcons.mars, label: 'MALE')),
              ),
              Expanded(
                child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.Female;
                        iconMf=FontAwesomeIcons.venus;//TODO:icons
                      });
                    },
                    colour: selectedGender == Gender.Female
                        ? activeCardColor
                        : inactiveCardColor,
                    cardChild: IconCards(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    )),
              ),
            ],
          ),
          Expanded(
            child: ReusableCard(
              colour: activeCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: TextStyle(color: Color(0xFF8D8E98), fontSize: 18.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$height',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 50.0,
                        ),
                      ),
                      Text('cm', style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Color(0xFFEB1555),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 200.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '$weight',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icons: FontAwesomeIcons.minus,
                            onClicked: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icons: FontAwesomeIcons.plus,
                            onClicked: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'AGE',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        '$age',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icons: FontAwesomeIcons.minus,
                            onClicked: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icons: FontAwesomeIcons.plus,
                            onClicked: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          CalculateButton(
            buttonTitle: 'CALCULATE YOUR BMI',
            onPressed: () {
              Calculation calc = Calculation(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(
                            bmiRes: calc.bmiCalculation(),
                            interpretation: calc.getInterpretation(),
                            resultText: calc.getResult(),
                            icons:iconMf ,//TODO:icons
                          )));
            },
          ),
        ],
      ),
    );
  }
}
