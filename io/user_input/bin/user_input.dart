import 'dart:io';

void main() {
  print("What's your name?");
  // Reads a line from the standard input. The suffix `Sync' indicates that
  // the methods is not asynchronous and it will block the execution
  String name = stdin.readLineSync();
  print("Hi $name!");
  print("What's your password?");
  print("it won't be displayed if you are running this script in a terminal");
  // Disables echoing of text input
  stdin.echoMode = false;
  String password = stdin.readLineSync();
  stdin.echoMode = true;
  // TODO: other samples
}
