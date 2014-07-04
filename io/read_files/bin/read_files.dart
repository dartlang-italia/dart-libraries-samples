import 'dart:io';

void main() {
  var file = new File("todos.csv");
  file.readAsLines().then((List<String> lines) {
    print("Things to do:\n");
    lines.forEach((String todo) {
      printTodo(todo);
    });
  });
}

void printTodo(String todo) {
  List<String> fields = todo.split(";");
  StringBuffer sb = new StringBuffer();
  sb.write("- ");
  sb.write(fields[1]);
  // TODO: complete
  print(sb.toString());

}
