import 'dart:collection';

class Developer   {
  String name;
  String preferredLanguage;
  
  Developer(this.name, this.preferredLanguage);
  
  toString() => name + " " + preferredLanguage;  
}

void main() {
  
  Developer giovanni = new Developer("Giovanni", "Dart");
  Developer claudio  = new Developer("Claudio", "Dart");

  
  Map team  = { "team A" : giovanni, "team B" : claudio };
  

  print(team);
  
  print(team.containsKey("team B"));
  print(team.containsKey("team X"));

  
  Developer alessandro = new Developer("Alessandro", "Go");
  Developer maurizio = new Developer("Maurizio", "C++");
  
  team.putIfAbsent("team X", () => alessandro);
  
  print(team.containsKey("team X"));

  
  

  
}
