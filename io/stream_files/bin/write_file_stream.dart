import 'dart:io';

void main() {
  var file = new File('foo.txt');
  IOSink sink = file.openWrite();
  "This is a test".codeUnits
  .forEach((int i){
    sink.add([i]);
  });
  sink.close()
  .then((_) => "wrote file: $file");
}