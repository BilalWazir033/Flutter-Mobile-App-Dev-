class Person {
  final String name;

  Person(this.name);

  String describe() {
    return 'Person: $name';
  }
}

class StudentPerson extends Person {
  final int rollNo;

  StudentPerson(super.name, this.rollNo);

  @override
  String describe() {
    return 'Student: $name, Roll No: $rollNo';
  }
}

void main() {
  StudentPerson student = StudentPerson('Bilal', 101);

  print(student.describe());
}