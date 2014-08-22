import 'dart:async';

main() {
  // We call the slow function
  slowFunction().then((String value) {
    // This run when the future completes
    print(value);
  });

  print("Immediately printed");
}

Future<String> slowFunction() {
  var completer = new Completer.sync();
  // Here we simulate a slow process
  new Timer(new Duration(seconds: 3), () {
    print("[future] slow process completed");
    completer.complete("hello!");
  });

  return completer.future;
}
