import 'constants.dart';

class CalculatorBrain {
  String previousNumber = '';
  String currentNumber = '0';
  CalcType currentCalcType = CalcType.none;
  bool isFirstDigit = true;

  void addDigit(String number) {
    if (number == '.' && currentNumber.contains('.') ||
        (currentNumber.length >= 16 && !isFirstDigit)) {
      //do nothing
    } else {
      if (isFirstDigit) {
        currentNumber = number;
        isFirstDigit = false;
      } else {
        currentNumber += number;
      }
    }
  }

  void deleteDigit() {
    if (currentNumber.length > 0) {
      currentNumber = currentNumber.substring(0, currentNumber.length - 1);
    }
  }

  void resetCalculator() {
    previousNumber = '';
    currentNumber = '0';
    isFirstDigit = true;
    currentCalcType = CalcType.none;
  }

  void setCurrentCalcType(CalcType newCalcType) {
    if (currentCalcType != CalcType.none && !isFirstDigit) {
      result();
    }
    currentCalcType = newCalcType;
    previousNumber = currentNumber;
    isFirstDigit = true;
  }

  void result() {
    if (!isFirstDigit) {
      switch (currentCalcType) {
        case CalcType.add:
          {
            double result =
                double.parse(previousNumber) + double.parse(currentNumber);
            print(double.parse(previousNumber));
            print(double.parse(currentNumber));
            print(result);
            currentNumber = result.toString();
          }
          break;
        case CalcType.sub:
          {
            currentNumber =
                (double.parse(previousNumber) - double.parse(currentNumber))
                    .toString();
          }
          break;
        case CalcType.div:
          {
            currentNumber =
                (double.parse(previousNumber) / double.parse(currentNumber))
                    .toString();
          }
          break;
        case CalcType.mult:
          {
            currentNumber =
                (double.parse(previousNumber) * double.parse(currentNumber))
                    .toString();
          }
          break;
        case CalcType.none:
          {
            //do nothing
          }
          break;
      }
    }
  }
}
