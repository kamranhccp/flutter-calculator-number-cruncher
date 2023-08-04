import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "%") {
      _output = (double.parse(output) / 100).toString();
    } else if (buttonText == "+/-") {
      _output = (double.parse(output) * -1).toString();
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(
      () {
        output = double.parse(_output).toStringAsFixed(1);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200.0,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black,
                    ],
                  ),
                  color: Colors.white30,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(
                    vertical: 24.0, horizontal: 12.0),
                child: Text(
                  output,
                  style: TextStyle(
                    fontSize: output.length > 8 ? 48.0 : 78.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(
                      "AC",
                      color1: Colors.white60,
                      color2: Colors.white60,
                      textColor: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "+/-",
                      color1: Colors.white60,
                      color2: Colors.white60,
                      textColor: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "%",
                      color1: Colors.white60,
                      color2: Colors.white60,
                      textColor: Colors.black,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "/",
                      color1: Colors.orange.shade600,
                      color2: Colors.orange.shade600,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(
                      "7",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "8",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "9",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "X",
                      color1: Colors.orange.shade600,
                      color2: Colors.orange.shade600,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(
                      "4",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "5",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "6",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "-",
                      color1: Colors.orange.shade600,
                      color2: Colors.orange.shade600,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(
                      "1",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "2",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "3",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "+",
                      color1: Colors.orange.shade600,
                      color2: Colors.orange.shade600,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(
                      "0",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "00",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      ".",
                      color1: Colors.white12.withOpacity(0.17),
                      color2: Colors.white12.withOpacity(0.17),
                      textColor: Colors.white,
                    ),
                    const SizedBox(width: 8),
                    buildButton(
                      "=",
                      color1: Colors.orange.shade600,
                      color2: Colors.orange.shade600,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton(String buttonText,
      {required Color color1,
      required Color color2,
      required Color textColor}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ],
        ),
      ),
      height: 86,
      width: 86,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }
}
