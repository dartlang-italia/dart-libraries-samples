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
  

  HasNextIterator hasNextIterator = new HasNextIterator(team.iterator);
  
 
  for (var iter = hasNextIterator; iter.hasNext;) {
    print(iter.next());
  }

  
}
