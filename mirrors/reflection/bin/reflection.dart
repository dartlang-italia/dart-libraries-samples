import 'dart:mirrors';

// TODO: complete

class Person {
  final String name;
  Person(this.name);

  void greet(Person other) {
    print("Hi ${other.name}!");
  }
}

void main() {

  // Reflecting a class
  ClassMirror classMirror = reflectClass(Person);
  classMirror.declarations.forEach((Symbol s, DeclarationMirror m) {
    print(s);
    print(m);
  });

  // Reflecting an instance
  Person a = new Person("Jimi");
  InstanceMirror instanceMirror = reflect(a);

  instanceMirror.invoke(#greet, [new Person('Frank')]);
}
