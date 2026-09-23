abstract class PersonInfo{
  String? Name;

  void genderIs();
}
abstract class PersonDetails{
  String? Address;

  void nationalityIs();
}

class person implements PersonInfo, PersonDetails{

  @override
  String? Name;
  @override
  String? Address;

  @override
  void genderIs(){
    print("Gender is Male");
  }

  @override
  void nationalityIs(){
    print("Nationality is Pakistani");
  }
}

void main(){
  person p1=person();
  p1.Name="Bilal";
  p1.Address="Waziristan";
  print("Name: ${p1.Name}");
  print("Address: ${p1.Address}");
  p1.genderIs();
  p1.nationalityIs();

}


git add .
git commit -m "interface implementation, single and multiple inheritance"
git push origin main