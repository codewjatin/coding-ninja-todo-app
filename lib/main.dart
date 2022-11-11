import 'package:flutter/material.dart';
import 'package:notes_app/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      home: const Home(),
      theme: ThemeData.dark(),
    );
  }
}
