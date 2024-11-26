import 'package:flutter/material.dart';
import 'package:mobil/screens/input_screen.dart';
import 'buttons_screen.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
        body: const Column(
          
          children: [
            InputScreen(),
            CalcKeyboardScreen(),
          ],
        )
      ),
    );
  }
}