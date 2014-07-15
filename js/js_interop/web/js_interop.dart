import 'dart:html';
import 'dart:js';

InputElement result = querySelector('#result');
InputElement inputX = querySelector('#x');
InputElement inputY = querySelector('#y');

void main() {
  // TODO: add comments
  querySelector("#alert").onClick.listen(jsAlert);
  inputX.onChange.listen(sumNumber);
  inputY.onChange.listen(sumNumber);
}

void jsAlert(MouseEvent event) {
  String jsText = context['text'];
  context.callMethod('alert', ['Hello from ' + jsText + '!']);
}

void sumNumber(Event event) {
  InputElement input_x = querySelector("#x");
  InputElement input_y = querySelector("#y");
  print(input_x.value);
  var x = int.parse(input_x.value);
  var y = int.parse(input_y.value);

  var jsCalculate = new JsObject(context['operation'], [x, y]);
  var sumResult = jsCalculate.callMethod('sum');

  result.value = sumResult.toString();
}