
import 'package:flutter/material.dart';

// Define an enum for student results
enum Result {
  Pass,
  Fail,
  Excellent,
}

// Function to get the result message
String showResult(Result result) {
  switch (result) {
    case Result.Pass:
      return 'Result: Passed! Well done!';

    case Result.Fail:
      return 'Result: Failed! Try again next time.';

    case Result.Excellent:
      return 'Result: Excellent! Great achievement!';
  }
}

// Application entry point
void main() {
  runApp(const StudentApp());
}

// Main application widget
class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set the student's result
    Result studentResult = Result.Excellent;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Student Result App'),
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Text(
            showResult(studentResult),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}

git add .
git commit -m "Implemented student result display using enum and function."
git push origin main