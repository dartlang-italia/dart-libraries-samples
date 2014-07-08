import 'dart:io';

String data = "Hey!";

void main() {
  // TODO: add comments
  File file = new File('log.txt');

  String content = new DateTime.now().toString() + " " + data + "\n";

  file.writeAsString(content, mode: APPEND).then((File file) {
    print("Data written");
  });
  print("This should print immediately");
}
