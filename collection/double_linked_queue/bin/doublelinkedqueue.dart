import 'dart:collection';

class Developer {
  String name;
  String preferredLanguage;
  
  Developer(this.name, this.preferredLanguage);
  
  toString() => name + " " + preferredLanguage;  
}

/*
 * DoubleLinkedQueue
 * A Queue implementation based on a double-linked list.
 * Allows constant time add, remove-at-ends and peek operations.
*/

void main() {
  
  Developer giovanni = new Developer("Giovanni", "Dart");
  Developer claudio  = new Developer("Claudio", "Dart");

  DoubleLinkedQueue<Developer> team = new DoubleLinkedQueue();
  
  team.add(giovanni);
  team.add(claudio);
  
  print(team);
  
  
  
  
  Developer alessandro = new Developer("Alessandro", "Go");
  Developer maurizio = new Developer("Maurizio", "C++");
  
  List team_b = [ alessandro, maurizio ];
  
  team.addAll(team_b);
  
  
  
  team.remove(maurizio);
  
  team.addFirst(maurizio);
  print (team);
  

  
}
