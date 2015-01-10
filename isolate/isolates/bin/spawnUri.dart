import 'dart:isolate';

main() {
  var response = new ReceivePort();
  Future<Isolate> remote = Isolate.spawnUri(Uri.parse("echo.dart"), ["foo"], response.sendPort);
  remote.then((_) => response.first)
    .then((msg) { print("received: $msg"); });
}