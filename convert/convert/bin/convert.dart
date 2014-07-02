import 'dart:convert';

void main() {
  // Decode a JSON string
  String json = '{"one" : "uno", "two" : "due", "three" : "tre"}';
  Map<String, String> dict = JSON.decode(json);
  print(dict["one"]); // uno
  print(json.runtimeType); // String
  print(dict.runtimeType); // _LinkedHashMap

  // Encode
  Map<String, Map<String, String>> nested = {
    "one": {
      "italian": "uno"
    },
    "two": {
      "italian": "due"
    },
    "three": {
      "italian": "tre"
    }
  };

  // {one: {italian: uno}, two: {italian: due}, three: {italian: tre}}
  print(nested);
  String toJson = JSON.encode(nested);
  // {"one":{"italian":"uno"},"two":{"italian":"due"},"three":{"italian":"tre"}}
  print(toJson);

  List<int> encoded = [224, 184, 170, 224, 184, 167, 224, 184, 177, 224, 184,
                       170, 224, 184, 148, 224, 184, 181];

  print(UTF8.decode(encoded));

}
