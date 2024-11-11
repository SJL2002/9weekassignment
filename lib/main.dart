import 'package:flutter/material.dart';
import 'VocabularyAddScreen.dart';
import 'VocabularyScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vocabulary App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VocabularyListScreen(),
    );
  }
}
