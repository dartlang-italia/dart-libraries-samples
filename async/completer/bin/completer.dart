import 'dart:async';

void main() {
  var completer = new Completer();
  Future ftr = completer.future;

  var N = 100000000;

  // Do some long process
  for (var i = 1; i <= N; i++) {
    // Print out progress:
    if ([N / 2, N / 4, N / 10, N / 20].contains(i)) print(
        "Not done yet.... completer completed? ${completer.isCompleted}");

    // Complete the completer when done.
    if (i == N) completer.complete("Done: Here's Some Value");
  }

  // Wait for future to complete, then print value
  ftr.then((value) => print(value));
}
