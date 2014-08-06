import 'dart:collection';

class Developer extends DoubleLinkedQueueEntry{
  String name;
  String preferredLanguage;
  
  Developer(this.name, this.preferredLanguage) : super(Developer);
  
  toString() => name + " " + preferredLanguage;  
}


void main() {
  
  Developer giovanni = new Developer("Giovanni", "Dart");
  Developer claudio  = new Developer("Claudio", "Dart");
  Developer alessandro = new Developer("Alessandro", "Go");
  Developer maurizio = new Developer("Maurizio", "C++");
   
  DoubleLinkedQueue<Developer> team = new DoubleLinkedQueue();
  
  team.addAll([giovanni,claudio,alessandro,maurizio]);
  
  print(team);
  
  DoubleLinkedQueueEntry first = team.firstEntry();
  print(first.element);
  
  Developer fabio = new Developer("Fabio", "Java");
  
  print(first.nextEntry().element);

  print(first.nextEntry().previousEntry().element);
  
  first.nextEntry().append(fabio);
  
  print(team);
  
  first.nextEntry().prepend(fabio);
  
  print(team);
  
  var dev = first.nextEntry().remove();
  
  print(team);
  
  print("$dev was fired!");

  
}
