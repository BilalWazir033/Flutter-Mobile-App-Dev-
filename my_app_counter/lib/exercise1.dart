class Student {
  final String name;
  final int rollNo;
  final int semester;

  Student(this.name, this.rollNo, this.semester);

  void introduce() {
    print('$rollNo - $name - Semester $semester');
  }
}

void main() {
  Student student1 = Student('Bilal', 101, 5);
  Student student2 = Student('Ahmad', 102, 5);

  student1.introduce();
  student2.introduce();
}