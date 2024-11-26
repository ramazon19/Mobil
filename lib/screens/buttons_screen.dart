import 'package:flutter/material.dart';

class CalcKeyboardScreen extends StatelessWidget {
  const CalcKeyboardScreen({super.key});

Widget getButton(Color btnColor, String btnText, Color bgColor, double fontSize){
  return ElevatedButton(
    onPressed: (){},
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor,
    ),
     child: Text(
      btnText,
      style: TextStyle(
        color: btnColor,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
     )
     );
}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
      padding: const EdgeInsets.all(40),
      children: <Widget> [
        getButton(Colors.grey, '%', Colors.white, 30),
        getButton(Colors.grey, '✓', Colors.white, 30),
        getButton(Colors.grey, 'CE', Colors.white, 30),
        getButton(Colors.white, 'C', const Color.fromARGB(255, 4, 21, 74), 30),
        getButton(Colors.grey, '7', Colors.grey[200]!, 30),
        getButton(Colors.grey, '8',  Colors.grey[200]!, 30),
        getButton(Colors.grey, '9', Colors.grey[200]!, 30),
        getButton(Colors.white, '-', Colors.red, 45),
        getButton(Colors.grey, '4', Colors.grey[200]!, 30),
        getButton(Colors.grey, '5',  Colors.grey[200]!, 30),
        getButton(Colors.grey, '6', Colors.grey[200]!, 30),
        getButton(Colors.white, '÷', Colors.blue, 45),
        getButton(Colors.grey, '1', Colors.grey[200]!, 30),
        getButton(Colors.grey, '2',  Colors.grey[200]!, 30),
        getButton(Colors.grey, '3', Colors.grey[200]!, 30),
        getButton(Colors.white, 'x', Colors.yellow, 45),
        getButton(Colors.grey, '.', Colors.grey[200]!, 30),
        getButton(Colors.grey, '0',  Colors.grey[200]!, 30),
        getButton(Colors.grey, '=', Colors.white, 30),
        getButton(Colors.white, '+', Colors.green, 45),
      ],
      ),
      );
  }
}