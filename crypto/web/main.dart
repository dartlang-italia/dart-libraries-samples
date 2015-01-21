import 'package:crypto/crypto.dart' as crypto;
import 'dart:html';


final sha1 = querySelector(".sha1");
final md5 = querySelector(".md5");
final sha256 = querySelector(".sha256");
final textInput = querySelector(".textInput");

main() {
  textInput.onInput.listen((e){
    var text = textInput.value;
    sha1.text = _sha1(text);
    md5.text = _sha1(text);
    sha256.text = _sha256(text);
  });
}

String _sha1(String text) {
  var sha1 = new crypto.SHA1();
  sha1.add(text.codeUnits);
  return crypto.CryptoUtils.bytesToHex(sha1.close());
}

String _md5(String text) {
  var md5 = new crypto.MD5();
  md5.add(text.codeUnits);
  return crypto.CryptoUtils.bytesToHex(md5.close());
}

String _sha256(String text) {
  var sha256 = new crypto.SHA256();
  sha256.add(text.codeUnits);
  return crypto.CryptoUtils.bytesToHex(sha256.close());
}