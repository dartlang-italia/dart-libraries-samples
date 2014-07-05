import 'dart:collection';

class Developer  extends LinkedListEntry {
  String name;
  String preferredLanguage;
  
  Developer(this.name, this.preferredLanguage);
  
  toString() => name + " " + preferredLanguage;  
}

void main() {
  
  Developer giovanni = new Developer("Giovanni", "Dart");
  Developer claudio  = new Developer("Claudio", "Dart");

  LinkedList<Developer> team = new LinkedList();
  
  team.add(giovanni);
  team.add(claudio);
  
  print(team);
  
  print(giovanni.next);
  
  print(claudio.previous);
  
  print(claudio.list);
  
  
  Developer alessandro = new Developer("Alessandro", "Go");
  Developer maurizio = new Developer("Maurizio", "C++");
  
  List team_b = [ alessandro, maurizio ];
  
  team.addAll(team_b);
  
  print(claudio.list);
  
  
  team.remove(maurizio);
  print (claudio.list);
  
  team.addFirst(maurizio);
  print (maurizio.list);

  
}
