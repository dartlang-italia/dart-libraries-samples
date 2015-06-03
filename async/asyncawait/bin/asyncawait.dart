import 'dart:async';

void main() {

  // Non async-await syntax:

  /*

    _waitForValue()
    .then((value){
      print(value);
    });

  */

  // async-await syntax:

  () async {
    var value = await _waitForValue();
    print(value);
  }();

}

Future<int> _waitForValue() => new Future((){

  var n = 100000000;

  // Do some long process
  for (var i = 1; i <= n; i++) {
    // Print out progress:
    if ([n / 2, n / 4, n / 10, n / 20].contains(i)) {
      print("Not done yet...");
    }

    // Return value when done.
    if (i == n) {
      print("Done: Here's Some Value");
      return i;
    }
  }

});