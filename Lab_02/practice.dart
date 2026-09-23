// Inheritance constructor
class parent {
  String? name;
    int? age;
  parent(String n, int a) {
      this.name = n;
      this.age = a;  
      print('Name: ${this.name}');
      print('Age: ${this.age}');
  }
}
class child extends parent {
  String? RollNo;
  child(String n, int a, String r) : super(n, a) {
    this.RollNo = r;
      print('RollNo: ${this.RollNo}');
    
  }
}

void main() {
  child c = child('Ali', 20, 'as23');
}

// git add .
// git commit -m "Added inheritance constructor example"
// git push origin main