import 'dart:collection';

class Developer{
  String name;
  String preferredLanguage;
  
  Developer(this.name, this.preferredLanguage);
  
  toString() => name + " " + preferredLanguage;  
}

void main() {
  
  Developer giovanni = new Developer("Giovanni", "Dart");
  Developer claudio  = new Developer("Claudio", "Dart");
  Developer giuseppe  = new Developer("Giuseppe", "Assembly");

  HashMap<String, Developer> team = new HashMap();
  
  team['Giovanni'] = giovanni;  
  team['Claudio'] = claudio;
  
  print(team);
  
  
  print(team.containsKey('Claudio'));
  print(team.containsKey('Seth'));
  
  print(team.containsValue(giovanni));
  print(team.containsValue(giuseppe)); 
  
  team['Giuseppe'] = giuseppe;
  print(team.containsValue(giuseppe)); 

  printElement(key, element) {
    print("$key => $element");
  }
    
  team.forEach((key,value) => printElement(key,value));
  
  Developer putAbsent(key) {
    return new Developer(key, "A language");
  }

  for (var devsName in ['Bob', 'Rohan', 'Sophena']) {
    team.putIfAbsent(devsName, () => putAbsent(devsName));
  }
  
  print(team);
  
  team.remove('Sophena');
  
  print(team);
  
  print(team.isEmpty);
  print(team.isNotEmpty);
  
  print(team.keys);
  print(team.values);
  print(team.length);
}
