import '06_object_oriented_programming/11_interfaces.dart';

class person{
  String? Name;
  int? age;

  void disperson(){
    print("Name: $Name");
    print("Age: $age");
  }
}
class man extends person{
  String? rollno;
  double? gpa;

  void disman(){
    print("Roll NO: $rollno");
    print("GPA: $gpa");

  }
}

void main(){
  man m1=man();

  m1.rollno="24pwbcs1345";
  m1.Name="Hazrat Bilal";
  m1.age=22;
  m1.gpa=3.84;

  m1.disperson();
  m1.disman();

}

// git add .
// git commit -m "Inheritance in detail with example"
// git push origin main