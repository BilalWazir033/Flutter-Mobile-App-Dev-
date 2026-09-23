// Multi-level inheritance 
class parent{
  String? CarNam;
  String? CarModel;

  void showDet(){
    print("This is parent class");
    print("Car Name: $CarNam");
    print("Car Model: $CarModel");
  }

}
class child1 extends parent{
  String? CarCol;

  void showCdet(){
    print("This is child1 class");
    print("Car Color: $CarCol");
  }
}

class child2 extends child1{
  String? CarPrice;

  void showCdet2(){
    print("This is child2 class");
    print("Car Price: $CarPrice");
  }
}

// Hierarchical inheritance
class male{
  String? name;
  String? age;
  void showDet(){
    print("This is male class");
    print("Name: $name");
    print("Age: $age");
  }
}
class student extends male{
  String? rollNo;
  void showSdet(){
    print("This is student class");
    print("Roll No: $rollNo");
  }
}
class teacher extends male{
  String? subject;
  void showTdet(){
    print("This is teacher class");
    print("Subject: $subject");
  }
}
class employee extends male{
  String? salary;
  void showEdet(){
    print("This is employee class");
    print("Salary: $salary");
  }
}

void main(){
  child2 ch=child2();

  ch.CarNam="Honda Civic";
  ch.CarModel="2023";
  ch.showDet();
  ch.CarCol="Red";
  ch.showCdet();
  ch.CarPrice="25000";
  ch.showCdet2();

print("\n\n <<<<<Herarchical Inheritance>>>> \n\n");


  student s1=student();
  s1.name="Mike";
  s1.age="20";
  s1.rollNo="12345";
  s1.showDet();
  s1.showSdet();

  teacher t1=teacher();
  t1.name="Mr. Smith";
  t1.age="40";
  t1.subject="Math";
  t1.showDet();
  t1.showTdet();

  employee e1=employee();
  e1.name="Mr. Johnson";
  e1.age="35";
  e1.salary="50000";
  e1.showDet();
  e1.showEdet();
}

git add .
git commit -m "Completed Lab_02/practice.dart with multi-level and hierarchical inheritance examples"
git push origin main