import 'package:flutter/material.dart';
import 'student_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secure Storage Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StudentSettings(),
    );
  }
}