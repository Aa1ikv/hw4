import 'package:flutter/material.dart';
import 'screens/akatsuki_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Акацуки',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const AkatsukiScreen(),
    );
  }
}