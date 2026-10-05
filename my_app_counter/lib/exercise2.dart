class Student {
  final String name;
  final int rollNo;
  final int semester;

  final List<int> _marks = [];

  Student(this.name, this.rollNo, this.semester);

  void addMark(int mark) {
    if (mark >= 0 && mark <= 100) {
      _marks.add(mark);
    } else {
      print('Invalid mark');
    }
  }

  double get average {
    if (_marks.isEmpty) {
      return 0;
    }

    int total = 0;

    for (int mark in _marks) {
      total += mark;
    }

    return total / _marks.length;
  }
}

void main() {
  Student student = Student('Bilal', 101, 5);

  student.addMark(85);
  student.addMark(90);
  student.addMark(78);

  print('${student.name} average: ${student.average}');
}