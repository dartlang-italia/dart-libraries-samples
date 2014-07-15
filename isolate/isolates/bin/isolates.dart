import 'dart:async';
import 'dart:isolate';
// TODO: comments
main() {
  ReceivePort receivePort = new ReceivePort();
  Future<Isolate> remote = Isolate.spawn(echo, receivePort.sendPort);
  remote.then((_) => receivePort.first).then((sendPort) {
    sendReceive(sendPort, "message sent from main()").then((msg) {
      print("Main received: $msg");
    });
  });
}

void echo(SendPort sender) {
  print("echo() the Isolate has been spawned!");
  ReceivePort receivePort = new ReceivePort();
  sender.send(receivePort.sendPort);
  receivePort.listen((data) {
    String msg = data[0];
    SendPort replyTo = data[1];
    print("Isolate received: $msg");
    replyTo.send("Greetings from echo() the Isolate!");
  });
}

Future sendReceive(SendPort port, String msg) {
  ReceivePort receivePort = new ReceivePort();
  port.send([msg, receivePort.sendPort]);
  return receivePort.first;
}