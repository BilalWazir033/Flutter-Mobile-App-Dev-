
void main() {

  // Step 1: Variables

  String studentName = "Bilal";
  int rollNumber = 123;
  int semester = 5;
  double cgpa = 3.82;
  bool isActive = true;

  const passingMarks = 50;
  final year = DateTime.now().year;

  print("Student Name: $studentName");
  print("Roll Number: $rollNumber");
  print("Semester: $semester");
  print("CGPA: $cgpa");
  print("Active: $isActive");
  print("Passing Marks: $passingMarks");
  print("Year: $year");


  // Step 2: Operators and conditions

  int math = 80;
  int programming = 75;
  int database = 65;

  int total = math + programming + database;
  double percentage = (total / 300) * 100;

  print("\nTotal: $total");
  print("Percentage: $percentage");

  if (percentage >= 80) {
    print("Grade: A");
  } else if (percentage >= 70) {
    print("Grade: B");
  } else if (percentage >= 60) {
    print("Grade: C");
  } else if (percentage >= 50) {
    print("Grade: D");
  } else {
    print("Grade: Fail");
  }


  // Step 3: Loops

  List<int> marks = [80, 75, 65, 45, 90];

  int passed = 0;

  for (int mark in marks) {
    print("Mark: $mark");

    if (mark >= passingMarks) {
      passed++;
    }
  }

  print("Passed Subjects: $passed");


  // Step 4: Functions

  double p = calculatePercentage(250, 300);
  String grade = calculateGrade(p);

  print("\nFunction Percentage: $p");
  print("Function Grade: $grade");


  // Step 5: Collections

  List<String> courses = ["Dart", "Flutter", "Database"];

  courses.add("Networking");
  courses.remove("Database");

  print("\nCourses: $courses");
  print("Number of Courses: ${courses.length}");

  Set<String> languages = {"Dart", "Python", "C++", "JavaScript"};

  languages.add("Dart");

  print("Languages: $languages");

  Map<String, int> courseMarks = {
    "Dart": 85,
    "Flutter": 78,
    "Database": 65
  };

  print("Course Marks:");

  for (var course in courseMarks.entries) {
    print("${course.key}: ${course.value}");
  }

  print("Dart is present: ${courseMarks.containsKey("Dart")}");


  // Step 6: Exception handling

  String number = "abc";

  try {
    int value = int.parse(number);
    print(value);
  } catch (e) {
    print("Invalid integer");
  }


  // Student Marks Analyzer

  Map<String, int> studentMarks = {
    "Dart": 85,
    "Flutter": 78,
    "Database": 65,
    "Networking": 45,
    "Software Engineering": 90
  };

  int totalMarks = calculateTotal(studentMarks);
  double average = calculateAverage(studentMarks);
  int highest = findHighest(studentMarks);
  int lowest = findLowest(studentMarks);
  String overallGrade = calculateGrade(average);

  print("\nStudent Marks Analyzer");

  for (var course in studentMarks.entries) {

    if (course.value >= passingMarks) {
      print("${course.key}: ${course.value} - Pass");
    } else {
      print("${course.key}: ${course.value} - Fail");
    }
  }

  print("Total Marks: $totalMarks");
  print("Average Marks: ${average.toStringAsFixed(2)}");
  print("Highest Mark: $highest");
  print("Lowest Mark: $lowest");
  print("Overall Grade: $overallGrade");


  // Extra feature: failed courses

  int failed = 0;

  for (int mark in studentMarks.values) {
    if (mark < passingMarks) {
      failed++;
    }
  }

  print("Failed Courses: $failed");
}


double calculatePercentage(int obtained, int total) {
  return (obtained / total) * 100;
}


String calculateGrade(double percentage) {
  if (percentage >= 80) {
    return "A";
  } else if (percentage >= 70) {
    return "B";
  } else if (percentage >= 60) {
    return "C";
  } else if (percentage >= 50) {
    return "D";
  } else {
    return "Fail";
  }
}


int calculateTotal(Map<String, int> marks) {
  int total = 0;

  for (int mark in marks.values) {
    total = total + mark;
  }

  return total;
}


double calculateAverage(Map<String, int> marks) {
  int total = calculateTotal(marks);
  return total / marks.length;
}


int findHighest(Map<String, int> marks) {
  int highest = marks.values.first;

  for (int mark in marks.values) {
    if (mark > highest) {
      highest = mark;
    }
  }

  return highest;
}


int findLowest(Map<String, int> marks) {
  int lowest = marks.values.first;

  for (int mark in marks.values) {
    if (mark < lowest) {
      lowest = mark;
    }
  }

  return lowest;
}

/*
Short Note:

List: Used for storing courses and marks.
Set: Used for storing programming languages.
Map: Used for storing course names and marks.
Function: Used for calculating percentage, grade, total, average, highest and lowest.
Condition: Used with if-else for grade and Pass/Fail.
Loop: Used with for-in to process marks.
*/
git add .
git commit -m ""