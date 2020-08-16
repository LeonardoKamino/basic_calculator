import 'package:basic_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:basic_calculator/components/button.dart';
import 'calculator_brain.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  CalculatorBrain calc = CalculatorBrain();

  void updateNumberOnScreen(String number) {
    setState(() {
      calc.addDigit(number);
    });
  }

  void changeCurrentCalcType(CalcType newCalcType) {
    setState(() {
      calc.setCurrentCalcType(newCalcType);
    });
  }

  Color colorForButton(CalcType buttonCalcType) {
    return buttonCalcType == calc.currentCalcType
        ? kLighterSelectedButtonColor
        : kLighterUnselectedButtonColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: kBackgroundColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.only(right: 10, top: 10),
              width: double.infinity,
              child: AutoSizeText(
                calc.currentNumber,
                maxLines: 1,
                style: TextStyle(color: Colors.white, fontSize: 50),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Button(
                  flex: 2,
                  onPressed: () {
                    setState(() {
                      calc.resetCalculator();
                    });
                  },
                  color: kLighterUnselectedButtonColor,
                  text: 'AC',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    setState(() {
                      calc.deleteDigit();
                    });
                  },
                  color: kLighterUnselectedButtonColor,
                  icon: FontAwesomeIcons.backspace,
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    changeCurrentCalcType(CalcType.div);
                  },
                  color: colorForButton(CalcType.div),
                  icon: FontAwesomeIcons.divide,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('1');
                  },
                  color: kDarkerButtonColor,
                  text: '1',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('2');
                  },
                  color: kDarkerButtonColor,
                  text: '2',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('3');
                  },
                  color: kDarkerButtonColor,
                  text: '3',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    changeCurrentCalcType(CalcType.mult);
                  },
                  color: colorForButton(CalcType.mult),
                  icon: FontAwesomeIcons.times,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('4');
                  },
                  color: kDarkerButtonColor,
                  text: '4',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('5');
                  },
                  color: kDarkerButtonColor,
                  text: '5',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('6');
                  },
                  color: kDarkerButtonColor,
                  text: '6',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    changeCurrentCalcType(CalcType.add);
                  },
                  color: colorForButton(CalcType.add),
                  icon: FontAwesomeIcons.plus,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('7');
                  },
                  color: kDarkerButtonColor,
                  text: '7',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('8');
                  },
                  color: kDarkerButtonColor,
                  text: '8',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('9');
                  },
                  color: kDarkerButtonColor,
                  text: '9',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    changeCurrentCalcType(CalcType.sub);
                  },
                  color: colorForButton(CalcType.sub),
                  icon: FontAwesomeIcons.minus,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Button(
                  flex: 2,
                  onPressed: () {
                    updateNumberOnScreen('0');
                  },
                  color: kDarkerButtonColor,
                  text: '0',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    updateNumberOnScreen('.');
                  },
                  color: kDarkerButtonColor,
                  text: '.',
                ),
                Button(
                  flex: 1,
                  onPressed: () {
                    setState(() {
                      calc.result();
                      calc.currentCalcType = CalcType.none;
                    });
                  },
                  color: kLighterUnselectedButtonColor,
                  icon: FontAwesomeIcons.equals,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
