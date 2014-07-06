import 'dart:io';

void main() {
  var file = new File('todos.csv');
  print("Loading things to do...\n");
  List<String> lines = file.readAsLinesSync();
  lines.forEach((String todo) {
    printTodo(todo);
  });
  print("\nDone loading things to do.");
}

void printTodo(String todo) {
  List<String> fields = todo.split(";");
  StringBuffer sb = new StringBuffer();
  sb.write("- ");
  sb.write(fields[1]);
  print(sb.toString());
}

