import 'package:flutter/material.dart';

// Custom Calculator Button Widget
class CalcButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? textColor;
  final Function() onPressed;

  const CalcButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: textColor, backgroundColor: color,
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

// Calculator Widget
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(String btnText) {
    print('Button Pressed: $btnText');

    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = (numOne + numTwo).toString();
      } else if (preOpr == '-') {
        finalResult = (numOne - numTwo).toString();
      } else if (preOpr == 'x') {
        finalResult = (numOne * numTwo).toString();
      } else if (preOpr == '/') {
        finalResult = (numOne / numTwo).toString();
      }
    } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = (numOne + numTwo).toString();
      } else if (opr == '-') {
        finalResult = (numOne - numTwo).toString();
      } else if (opr == 'x') {
        finalResult = (numOne * numTwo).toString();
      } else if (opr == '/') {
        finalResult = (numOne / numTwo).toString();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = (numOne / 100).toString();
      finalResult = result;
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            // Calculator display
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '$text',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                      ),
                    ),
                  )
                ],
              ),
            ),
            buildButtonRow(['AC', '+/-', '%', '/'], Colors.grey),
            SizedBox(height: 10),
            buildButtonRow(['7', '8', '9', 'x'], Colors.grey[850]),
            SizedBox(height: 10),
            buildButtonRow(['4', '5', '6', '-'], Colors.grey[850]),
            SizedBox(height: 10),
            buildButtonRow(['1', '2', '3', '+'], Colors.grey[850]),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //this is button Zero
                ElevatedButton(
                  onPressed: () {
                    calculation('0');
                  },
                  child: Text(
                    '0',
                    style: TextStyle(fontSize: 35, color: Colors.grey[850]),
                  ),
                ),
                CalcButton(
                  text: '.',
                  onPressed: () => calculation('.'),
                  color: Colors.grey[850],
                ),
                CalcButton(
                  text: '=',
                  onPressed: () => calculation('='),
                  color: Colors.amber[700],
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Row buildButtonRow(List<String> buttonValues, Color? color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: buttonValues.map((text) {
        return CalcButton(
          text: text,
          color: color,
          onPressed: () => calculation(text),
        );
      }).toList(),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Calculator(),
  ));
}
