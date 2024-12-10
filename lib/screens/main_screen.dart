import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math'; 

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _controller = TextEditingController(text: '0');
  String _a = '';
  String _b = '';
  String _oper = '';
  double _result = 0;

 void btnPressed(String btnText) {
  if (btnText == 'C') {
    _controller.text = '0';
    _a = '';
    _b = '';
    _oper = '';
    _result = 0;
  } else if (btnText == '+' ||
      btnText == '*' ||
      btnText == '-' ||
      btnText == '/' ||
      btnText == '%' ||
      btnText == '✓') {
    _oper = btnText;
  } else if (btnText == '=') {
    switch (_oper) {
      case '+':
        _result = double.parse(_a) + double.parse(_b);
        break;
      case '-':
        _result = double.parse(_a) - double.parse(_b);
        break;
      case '/':
        _result = double.parse(_a) / double.parse(_b);
        break;
      case '*':
        _result = double.parse(_a) * double.parse(_b);
        break;
      case '%':
        _result = (double.parse(_a) * double.parse(_b)) / 100;
        break;
      case '✓':
        _result = double.parse(_a) >= 0
            ? sqrt(double.parse(_a))
            : double.nan;
        break;
    }
    _controller.text = _result.toString();
    _a = '';
    _b = '';
    _oper = '';
    _result = 0;
  } else if (btnText == 'CE') { // CE funksiyasi
    if (_b.isNotEmpty) {
      _b = '';
      _controller.text = '0';
    } else if (_a.isNotEmpty && _oper.isEmpty) {
      _a = '';
      _controller.text = '0';
    }
  } else {
    if (_oper != '') {
      _b += btnText;
      _controller.text = _b;
    } else {
      _a += btnText;
      _controller.text = _a;
    }
  }
  setState(() {});
}


  Widget getButton(Color btnColor, String btnText, Color bgColor, double fontSize) {
    return ElevatedButton(
        onPressed: () => btnPressed(btnText),
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
        ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My calculator',
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My calculator'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _controller,
                style: TextStyle(
                  fontSize: 24,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26))),
                  counterText: '',
                ),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.end,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                ],
                maxLength: 15,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                padding: const EdgeInsets.all(40),
                children: <Widget>[
                  getButton(const Color.fromARGB(255, 80, 80, 80), '%',
                      Colors.white, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '✓',
                      Colors.white, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), 'CE',
                      Colors.white, 30),
                  getButton(Colors.white, 'C',
                      const Color.fromARGB(255, 4, 21, 74), 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '7',
                      Colors.grey[200]!, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '8',
                      Colors.grey[200]!, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '9',
                      Colors.grey[200]!, 30),
                  getButton(Colors.white, '-', Colors.red, 45),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '4',
                      Colors.grey[200]!, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '5',
                      Colors.grey[200]!, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '6',
                      Colors.grey[200]!, 30),
                  getButton(Colors.white, '/', Colors.blue, 45),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '1',
                      Colors.grey[200]!, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '2',
                      Colors.grey[200]!, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '3',
                      Colors.grey[200]!, 30),
                  getButton(Colors.white, '*', Colors.yellow, 45),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '.',
                      Colors.grey[200]!, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '0',
                      Colors.grey[200]!, 30),
                  getButton(const Color.fromARGB(255, 80, 80, 80), '=',
                      Colors.white, 30),
                  getButton(Colors.white, '+', Colors.green, 45),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
