import 'dart:html';
import 'dart:js' show context, JsObject;

void main() {
  querySelector("#save").onClick.listen(save);
}

void save(MouseEvent event) {
  var localforage = context['localforage'];
  //Call the setItem method of localforage
  InputElement string_example = querySelector("#string_example");
  localforage.callMethod('setItem',['string', string_example.value]);
  
  SelectElement array_example = querySelector("#array_example");
  localforage.callMethod('setItem',['array', new JsObject.jsify(array_example.selectedOptions).toString()]);
  
  querySelector(".show").innerHtml = "";
  //Use a callback for localforage for insert the value saved
  localforage.callMethod('getItem',['string', returnValue]);
  localforage.callMethod('getItem',['array', returnValue]);
}

returnValue(data) {
  querySelector(".show").innerHtml += data + '<br>';
}
