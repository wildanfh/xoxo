import 'package:flutter/material.dart';
import 'package:xoxo/start_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XOXO',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Oxygen',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const StartScreen(),
    );
  }
}