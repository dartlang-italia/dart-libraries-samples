/*
 * Random access files are best for large files.
*/

import 'dart:io';

void main() {
  var file = new File('bigFile.txt');
  if(file.existsSync()) {
    file.open(mode:FileMode.READ)
    .then((RandomAccessFile raf){
      var length = raf.lengthSync();
      print(length);
      
      // Position starts at zero.
      var position = raf.positionSync();
      print(position);
      
      // Read one byte.
      var b = raf.readByteSync();
      print(b);
      
      print(new String.fromCharCode(b)); // Should be 'L'
      
      // Notice position moves forward.
      print(raf.positionSync());
      
      // Read another byte.
      b = raf.readByteSync();
      print(b);
      
      print(new String.fromCharCode(b)); // Should be 'o'
      
      // Create fixed list of length.
      var list = new List(length);
      
      // '0' is actually at the 3rd character since we already read the first two
      raf.readIntoSync(list, 0,100);
      
      print(new String.fromCharCodes(list.where((e) => e != null).toList()));
      
    });
  }
}