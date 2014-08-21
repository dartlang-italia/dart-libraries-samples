import 'dart:async';

void main() {
  var completer = new Completer();
  Future ftr = completer.future;

  var n = 100000000;

  // Do some long process
  for (var i = 1; i <= n; i++) {
    // Print out progress:
    if ([n / 2, n / 4, n / 10, n / 20].contains(i)) {
      print( "Not done yet.... completer completed? ${completer.isCompleted}");
    }

    // Complete the completer when done.
    if (i == n) {
      completer.complete("Done: Here's Some Value");
    }
  }

  // Wait for future to complete, then print value
  ftr.then((value) => print(value));
}
