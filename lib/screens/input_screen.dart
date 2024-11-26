import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(26.0),
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
      ),
      textAlign: TextAlign.end,
    ),
    );
  }
}