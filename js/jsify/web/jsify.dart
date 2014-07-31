import 'dart:html';
import 'dart:js' show context, JsObject;

void main() {
  querySelector("#save").onClick.listen(save);
}

void save(MouseEvent event) {
  //Get the localforage object in JS
  var localforage = context['localforage'];
  
  InputElement string_example = querySelector("#string_example");
  //Call the setItem method of localforage
  //First parameter is the method, the second is used for the parameters in array of the js method
  localforage.callMethod('setItem',['string', string_example.value]);
  
  SelectElement array_example = querySelector("#array_example");
  localforage.callMethod('setItem',['array', new JsObject.jsify(array_example.selectedOptions).toString()]);
  
  querySelector(".show").innerHtml = "";
  //Use a Dart callback for localforage for insert the value saved
  localforage.callMethod('getItem',['string', returnValue]);
  localforage.callMethod('getItem',['array', returnValue]);
}

returnValue(data) {
  querySelector(".show").innerHtml += data + '<br>';
}
