import 'dart:html';
import 'dart:typed_data';

/*
 *  Canvas drawing technique by [kangax](https://twitter.com/kangax).
 *  Read more here:
 *  http://perfectionkills.com/exploring-canvas-drawing-techniques/
 *
 */

void main() {
  CanvasElement canvas = querySelector("#c");
  ButtonElement btn = querySelector('#btn');
  ButtonElement clear = querySelector('#clear');
  CanvasRenderingContext2D ctx = canvas.getContext('2d');

  ctx
    ..lineWidth = 1
    ..lineJoin = ctx.lineCap = 'round'
    ..fillStyle = '#ffffff'
    ..fillRect(0, 0, canvas.width, canvas.height);

  Rectangle rect = canvas.getBoundingClientRect();
  bool isDrawing = false;
  List points = [];

  canvas.onMouseDown.listen((e) {
    e.preventDefault();
    points = [];
    isDrawing = true;
    points.add({"x": e.client.x - rect.left, "y": e.client.y - rect.top});
  });

  canvas.onMouseMove.listen((e) {
    if (!isDrawing) {
      return;
    }

    points.add({"x": e.client.x - rect.left, "y": e.client.y - rect.top});
    ctx
      ..beginPath()
      ..moveTo(points[points.length - 2]["x"], points[points.length - 2]["y"])
      ..lineTo(points[points.length - 1]["x"], points[points.length - 1]["y"])
      ..stroke();

    for (var i = 0; i < points.length; i++) {
      var dx = points[i]["x"] - points[points.length -1]["x"];
      var dy = points[i]["y"] - points[points.length -1]["y"];
      var d = dx * dx + dy * dy;

      if (d < 1000) {
        ctx
          ..beginPath()
          ..strokeStyle = 'rgba(0,0,0,0.3)'
          ..moveTo(points[points.length-1]["x"] + (dx * 0.2),
              points[points.length-1]["y"] + (dy * 0.2))

          ..lineTo(points[i]["x"] - (dx * 0.2), points[i]["y"] - (dy * 0.2))
          ..stroke();
      }
    }
  });

  canvas.onMouseUp.listen((e) {
    isDrawing = false;
    points.length = 0;
  });

  btn.onClick.listen((e) {
    // TODO: Add some comments
    String dataUrl = canvas.toDataUrl();
    String byteString = window.atob(dataUrl.split(',')[1]);
    Uint8List arrayBuffer = new Uint8List(byteString.length);
    Uint8List dataArray = new Uint8List.view(arrayBuffer.buffer);
    for (var i = 0; i < byteString.length; i++) {
      dataArray[i] = byteString.codeUnitAt(i);
    }
    Blob blob = new Blob([dataArray], 'image/png');
    new AnchorElement(href: Url.createObjectUrl(blob))
      ..download = 'my_canvas.png'
      ..click();
  });

  clear.onClick.listen((e) {
    ctx
      ..fillStyle = '#ffffff'
      ..fillRect(0, 0, canvas.width, canvas.height);
  });
}
