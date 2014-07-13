import 'dart:io';

void main() {
  print("What's your name?");
  String name = stdin.readLineSync();
  print("Hi $name!");
  print("What's your password?");
  print("it won't be displayed if you are running this script in a terminal");
  stdin.echoMode = false;
  String password = stdin.readLineSync();
  stdin.echoMode = true;
  // TODO: comments and other samples
}
