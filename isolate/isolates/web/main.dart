import 'dart:html';
import 'dart:isolate';
import 'dart:async';

final content = querySelector("#content");

main() {
  var response = new ReceivePort();
  Future<Isolate> remote = Isolate.spawnUri(Uri.parse("echo.dart"), ["foo"], response.sendPort);
  remote.then((_) => response.first)
    .then((msg) {
      content.text = msg;
    });
}

