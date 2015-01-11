// run as dart --enable-async bin/asyncawait.dart

import 'dart:async';

void main() async {

  // Non async-await syntax:

  /*

    _waitForValue()
    .then((value){
      print(value);
    });

  */

  // async-await syntax:

  var value = await _waitForValue();
  print(value);
}

Future _waitForValue() {
  var completer = new Completer();

  var n = 100000000;

  // Do some long process
  for (var i = 1; i <= n; i++) {
    // Print out progress:
    if ([n / 2, n / 4, n / 10, n / 20].contains(i)) {
      print( "Not done yet.... completer completed? ${completer.isCompleted}");
    }

    // Complete the completer when done.
    if (i == n) {
      print("Done: Here's Some Value");
      completer.complete(i);
    }
  }

  return completer.future;
}