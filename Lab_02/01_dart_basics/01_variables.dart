/*
Variables store values under readable names. This example introduces declarations, initialization, string interpolation, and Dart comment styles.
*/

void main() {
  print('This is my code for today:');

  String userName = 'Ali';
  int userAge = 12;

  print(userName); // Prints a value to the console.
  print(userAge);

  //Or

  print(
    'User name is $userName',
  ); // String interpolation inserts a value into text.
  print('User age is $userAge');

  String name2='Bilal';
  int age2=20;
  print("My name is $name2 and my age is $age2");
}

// Dart supports single-line comments, block comments, and documentation comments (///).

