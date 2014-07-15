import 'dart:html';
import 'dart:js';

void main() {
  querySelector("#alert")..onClick.listen(jsAlert);
  querySelector("#x")..onChange.listen(sumNumber);
  querySelector("#y")..onChange.listen(sumNumber);
}

void jsAlert(MouseEvent event) {
  String jsText = context['text'];
  context.callMethod('alert', ['Hello from ' + jsText + '!']);
}

void sumNumber(Event event) {
  InputElement input_x = querySelector("#x");
  InputElement input_y = querySelector("#y");
  var x = int.parse(input_x.value);
  var y = int.parse(input_y.value);
  assert(x is int);
  assert(y is int);
  var jsCalculate = new JsObject(context['operation'], [x, y]);
  querySelector("#value").text = jsCalculate.callMethod('sum');
}
