import "dart:html";

TextAreaElement area;

main(){
  area = querySelector('#text');
  load();
  querySelector('#save-text').onClick.listen((e) => save());
}

load(){
  // Get data from local storage with key "value"
  if (window.localStorage.containsKey("text")) {
    area.value = window.localStorage["text"];
  }
}

save(){
  // put data in local storage with key "value"
  window.localStorage["text"] = area.value;
}