import 'dart:async';

void main() {

  // We will create an iterator from text's words
  String str =
      """
Lorem ipsum dolor sit amet, 
consectetur adipisicing elit. 
Dolore, mollitia, amet repellat 
pariatur maxime praesentium dicta 
qui quas aliquid minus tempore 
possimus molestiae saepe alias 
a quibusdam reprehenderit obcaecati.
 """;

  // Get the iterator
  Iterator source = str.split(" ").iterator;

  // Create a new StreamController
  StreamController data = new StreamController();

  // Get the stream
  Stream stream = data.stream;

  // Listen to the stream
  stream.listen((e) {
    print(e);
  });

  // Repeat each second
  var timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
    // Move to the next element of the iterator. moveNext returns false if
    // current is the last element
    if (source.moveNext()) {
      // Add data to string
      data.add(source.current.trim());

    } else {
      // Cancel the timer
      timer.cancel();
    }
  });
}
