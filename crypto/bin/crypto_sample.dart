import 'package:crypto/crypto.dart' as crypto;

main() {
  var text = "Lorem ipsum Laborum est elit enim Ut cillum adipisicing et consectetur Ut.";
  print(text);
  print("SHA1: ${_sha1(text)}");
  print("MD5: ${_md5(text)}");
  print("SHA256: ${_sha256(text)}");
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