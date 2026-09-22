class User{
  String? _userID;
  String? _userName;

  void setUserID(String? UID){
    _userID=UID;
  }
  void setUserName(String? UN){
    _userName=UN;
  }

  String? getUserID(){
    return _userID;
  }
  String? getUserName(){
    return _userName;
  }
}

void main(){
  User dp=User();

  dp.setUserID("24pwbcs1345");
  dp.setUserName("Hazrat Bilal");

print("User ID: ${dp.getUserID()}");
print("User Nmae: ${dp.getUserName()}");

}


// git add .
// git commit -m "Encapsulation in Dart: Using private variables with getters and setters to protect object state."
// git push origin main