import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "";

  Widget btn(var textt, Color colorr) {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            result = result + textt;
          });
        },
        child: Text(textt),
        style: ElevatedButton.styleFrom(
          primary: colorr,
        ));
  }

  clearr() {
    setState(() {
      result = "";
    });
  }

  output() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      result = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width * 0.90;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: widthSize,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffB9B3B3),
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  result,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("7", Color(0x080808)),
                btn("8", Color(0x080808)),
                btn("9", Color(0x080808)),
                btn("+", Color(0x474747)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("4", Color(0x080808)),
                btn("5", Color(0x080808)),
                btn("6", Color(0x080808)),
                btn("-", Color(0x474747)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("1", Color(0x080808)),
                btn("2", Color(0x080808)),
                btn("3", Color(0x080808)),
                btn("*", Color(0x474747)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                btn("0", Color(0x080808)),
                ElevatedButton(
                  onPressed: clearr,
                  child: Text("C"),
                  style: ElevatedButton.styleFrom(primary: Color(0xff7C0505)),
                ),
                ElevatedButton(
                  onPressed: output,
                  child: Text("="),
                  style: ElevatedButton.styleFrom(primary: Color(0xff2B4286)),
                ),
                btn("/", Color(0x474747)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
