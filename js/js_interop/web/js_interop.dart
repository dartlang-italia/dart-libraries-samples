import 'dart:html';
import 'dart:js';

InputElement result = querySelector('#result');
InputElement inputX = querySelector('#x');
InputElement inputY = querySelector('#y');

void main() {
  //Add an Alert with a javascript variable
  querySelector("#alert").onClick.listen(jsAlert);
  inputX.onChange.listen(sumNumber);
  inputY.onChange.listen(sumNumber);
}

void jsAlert(MouseEvent event) {
  //Get the js variable in Dart
  String jsText = context['text'];
  //First parameter is the js function, the second is used for the parameters in array of the js function
  context.callMethod('alert', ['Hello from ' + jsText + '!']);
}

void sumNumber(Event event) {
  InputElement input_x = querySelector("#x");
  InputElement input_y = querySelector("#y");
  //Convert the value in number
  var x = int.parse(input_x.value);
  var y = int.parse(input_y.value);
  //Call a javascript function with two parameters
  var jsCalculate = new JsObject(context['operation'], [x, y]);
  //Call a method of the js function
  var sumResult = jsCalculate.callMethod('sum');

  result.value = sumResult.toString();
}