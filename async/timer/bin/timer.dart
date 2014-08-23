import 'dart:async';

main() {
  // Creates a new Timer. After a duration of 1 second, `wakeMeUp()` is called
  new Timer(new Duration(seconds: 1), wakeMeUp);

  // The above code is the equivalent of this:
  new Timer(new Duration(seconds: 1), () {
    print("WAKE UP!");
  });

  /* How do you cancel a timer? */

  // Creates and runs a new Timer
  Timer ourTimer = new Timer(new Duration(seconds: 10), () => print("hi"));

  // If our timer is active...
  if (ourTimer.isActive) {
    // ...then cancels the timer
    ourTimer.cancel();
  }


  // Repeating the callback periodically:
  int count = 10;
  // The callback function of Timer.periodic takes the timer itself as a
  // parameter. We can use it to stop the callback repetition
  new Timer.periodic(new Duration(seconds: 1), (Timer t) {
    print(count);
    count--;
    // If a condition is met...
    if (count == 0) {
      print("Happy new year!");
      // .. then cancel the timer
      t.cancel();
    }
  });

}

void wakeMeUp() {
  print("WAKE UP!");
}
