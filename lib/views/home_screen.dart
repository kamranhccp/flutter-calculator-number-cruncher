import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        // app bar with title and history button
        appBar: AppBar(
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20.0.r),
            ),
          ),
          title: Text(
            "Number Cruncher",
            style: TextStyle(
              fontSize: 20.0.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  CircleBorder(
                    side: BorderSide(
                      color: Colors.white,
                      width: 1.0.w,
                    ),
                  ),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 12.0.w),
                ),
              ),
              onPressed: () {},
              icon: Icon(Icons.history),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Container(
              height: 145.h,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black,
                  ],
                ),
                color: Colors.white30,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0.r),
                ),
              ),
              alignment: Alignment.centerRight,
              padding:
                  EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 12.0.w),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: output.length > 8 ? 40.0.sp : 70.0.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(height: 5.0.h),
            Padding(
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    "AC",
                    color1: Colors.white60,
                    color2: Colors.white60,
                    textColor: Colors.black,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "+/-",
                    color1: Colors.white60,
                    color2: Colors.white60,
                    textColor: Colors.black,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "%",
                    color1: Colors.white60,
                    color2: Colors.white60,
                    textColor: Colors.black,
                  ),
                  SizedBox(width: 8.0.w),
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
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    "7",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "8",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "9",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
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
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    "4",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "5",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "6",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
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
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    "1",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "2",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "3",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
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
              padding: EdgeInsets.all(8.0.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    "0",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    "00",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
                  buildButton(
                    ".",
                    color1: Colors.white12.withOpacity(0.17),
                    color2: Colors.white12.withOpacity(0.17),
                    textColor: Colors.white,
                  ),
                  SizedBox(width: 8.0.w),
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
    );
  }

  Widget buildButton(String buttonText,
      {required Color color1,
      required Color color2,
      required Color textColor}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0.r),
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
            borderRadius: BorderRadius.circular(50.0.r),
          ),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 28.0.sp,
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
