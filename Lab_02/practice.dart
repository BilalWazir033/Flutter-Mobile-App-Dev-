mixin Animal {
  void eat() {
    print("Animal is eating");
  }
}
mixin Bird {
  void fly() {
    print("Bird is flying");
  }
}

class Dog with Animal , Bird{
  void bark() {
    print("Dog is barking");
  }

}
void main() {
  Dog dog = Dog();
  dog.eat();
  dog.fly();
  dog.bark();
}

git add .
git commit -m "Added mixin example with Animal and Bird behaviors to Dog class"
git push origin main