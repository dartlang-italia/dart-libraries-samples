// main() is the entry point of a Dart application
void main() {
  /*
   * Strings
  */
  String language = "Dart";
  String adjective = "good";
  // Dart is optionally typed
  var qualifier = "very";

  // String interpolation
  print("$language is $qualifier $adjective!");
  // Prints: "Dart is very good!"
  print("$language is ${qualifier.toUpperCase()} $adjective!");
  // Prints: "Dart is VERY good!"

  // String concatenation
  print(language + " is " + qualifier + " " + adjective + "!");
  // Prints: "Dart is very good!"

  String veryLongString = "";

  veryLongString += language;
  veryLongString += " is ";
  veryLongString += qualifier;
  veryLongString += " $adjective!";

  // Common strings operations
  String filename = "IMG_0001.jpg";

  // Getting string length
  print(filename.length); // 12

  // Checking if string is empty
  print(filename.isEmpty); // false

  // Getting character at position [i]
  print(filename[3]); // "_"

  // Getting a substring
  print(filename.substring(4));   // "0001.jpg"
  print(filename.substring(0,4)); // "IMG_"

  // Getting the index of the first match
  print(filename.indexOf("_"));   // 3

  // Other operations
  print(filename == "IMG_0001.jpg"); // true
  print(filename.startsWith("IMG")); // true
  print(filename.endsWith("png")); // false
  print(filename.split(new RegExp(r"_|\."))); // [IMG, 0001, jpg]
  print(filename.codeUnits); // [73, 77, 71, . . ., 46, 106, 112, 103]

  // Creating a string from a list of char codes
  print(new String.fromCharCodes([73, 77, 71]));  // Dart

  // Converting a String to an integer
  String value = "1";
  int integer = int.parse(value);

  // Getting the runtime type of an object
  print(integer.runtimeType); // int
  print(value.runtimeType);   // String

  // Checking data types
  print(value is String); // true
  // "is!" is the negation of "is", notice that the "!" is postfixed
  print(value is! String); // false

  /*
   * booleans
   */

  bool auth = true;
  print(auth);            // true
  print(auth.toString()); // "true"

  if (auth) {
    print("You are authenticated");
  } else {
    print("Not authenticated");
  }

  // Using the ternary operator for some one-line awesomeness
  String auth_message = auth ? "You are authenticated" : "Not authenticated";
  print(auth_message); //

  /*
   *  Numbers
   */

  // Integer numbers
  int id = 42;

  // Double precision floating point numbers
  double g = 9.80;
  // Using scientific notation
  double G = 6.67e-11;  // 6.67 * 10^(-11)

  // A generic number
  num number = 1985;

  // Some operations
  print(g/2);   // 4.9
  print(id/2);  // 21.0 (use the "~/" operator for integer division)
  print(id~/2); // 21
  print(id.isEven);     // true
  print(id.isInfinite); // false

  // Converting a number to String
  print(id.toString());               // "42"
  print(id.toStringAsExponential());  // "4.2e+1"
  print(G.toStringAsExponential());   // "6.67e-11"

  // How many bits are required to store an integer?
  print(1.bitLength);     // 1
  print(8.bitLength);     // 4
  print(1985.bitLength);  // 11

  /*
   *  Lists
   */
  List<String> letters = ["A", "B", "C"];
  print(letters); // ["A", "B", "C"]

  // Common operations

  // Adding elements to a list
  List<String> newList = [];
  print(newList); // []

  newList.add("K");
  print(newList); // [K]

  newList.addAll(["X", "Y", "Z"]);
  print(newList); // [K, X, Y, Z]

  // Removing elements
  newList.remove; // Removes first element
  newList.removeAt(2);  // Removes element at n position
  newList.clear; // Removes all elements

  // How many elements has the lists?
  print(letters.length);

  // Loop through each element of the list
  for (var i = 0; i < letters.length; i++) {
    print(letters[i]);
  }

  // Another way to loop through list elements
  letters.forEach((String letter) {
    print(letter);
  });

  // Getting elements from the list
  print(letters.first); // A
  print(letters.last);  // C

  print(letters.indexOf("B")); // 1
  print(letters.indexOf("Z")); // -1

  // Reversing a List. Notice that this method returns an Iterable object
  print(letters.reversed);  // (C, B, A)

  // Creating a List from an Iterable
  print(new List.from(letters.reversed)); // [C, B, A]

  // An iterable of elements that satisfy the condition
  print(letters.where((l) => l != "A"));  // (B, C)

  // Taking first n elements
  print(letters.take(2)); // (A, B)

  List<String> longerList = ["A", "B", "C", "D", "E", "F", "G", "H", "I"];

  // Taking elements while the condition is satisfied
  print(longerList.takeWhile((l) => l != "F")); // (A, B, C, D, E)

  // TODO: Maps

}
