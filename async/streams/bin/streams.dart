import 'dart:async';

main() {
  // We generate a list
  List<int> list = new List.generate(100, (int i) => i);
  Stream stream = new Stream.fromIterable(list);

  // Subscribing to a stream
  stream.listen((e) {
    print(e);
  });

  // Streams are single-subscriber by default. If you try to listen again
  // to the same stream, a Bad state exception will be raised

  try {
    // This will raise a Bad state exception...
    stream.listen((e) {
      print(e);
    });
  } catch (e) {
    // . . .
  }

  // Convert a stream to a broadcast stream to allow multiple listeners
  Stream broadcast = new Stream.fromIterable(list).asBroadcastStream();
  broadcast.listen((e) {
    print("[first subscriber] $e");
  });

  broadcast.listen((e) {
    print("[second subscriber] $e");
  });


  // Using `onDone` and `onError`
  broadcast.listen((e) {
    // Do something
  }, onDone: () {
    print("This is called when there is no more data to read");
  }, onError: (err) {
    print("This is called when an error occurred in the stram");
  });

  // Taking stream values that met given conditions
  broadcast.where((int i) => i.isEven).listen((e) {
    print("Even number: $e");
  });

  // Taking first value
  broadcast.first.then((e) {
    print("First element: $e");
  });

  // Taking last element
  broadcast.last.then((e) {
    print("Last element: $e");
  });

  // Taking first n values
  broadcast.take(5).listen((e) {
    print("Taking first 5 values: $e");
  });

  // Skipping first n elements
  broadcast.skip(99).listen((e) {
    print("Skipping 99 elements: $e");
  });

}
