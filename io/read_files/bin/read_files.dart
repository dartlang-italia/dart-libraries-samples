import 'dart:io';

void main() {
  var file = new File("todos.csv");
  // .readAsLines is a Future
  file.readAsLines().then((List<String> lines) {
    lines.forEach((String todo) {
      printTodo(todo);
    });
    print("\nDone loading thigs to do.");
  });
  // This should print immediately
  print("Loading things to do...\n");
}

void printTodo(String todo) {
  List<String> fields = todo.split(";");
  StringBuffer sb = new StringBuffer();
  sb.write("- ");
  sb.write(fields[1]);
  print(sb.toString());
}
