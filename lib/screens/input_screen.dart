import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child:  TextField(
      style: TextStyle(
        fontSize: 24,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.blue,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(26))
        ),
        counterText: '',
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.end,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
      ],
      maxLength: 15,
    ),
    );
  }
}