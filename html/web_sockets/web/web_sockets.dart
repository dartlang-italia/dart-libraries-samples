import 'dart:html';

void main() {
  // TODO: add comments
  TextAreaElement textarea = querySelector("#log");
  InputElement input = querySelector("#input");
  ButtonElement sendButton = querySelector("#btn");
  ButtonElement closeButton = querySelector("#close");
  WebSocket ws = new WebSocket("ws://echo.websocket.org");
  ws.onOpen.listen((e) {
    textarea.appendText("[INFO] Connected\n");

    ws.onMessage.listen((MessageEvent e) {
      textarea.appendText("[RECEIVED] ${e.data}\n");
    });
  });

  ws.onClose.listen((e) {
    textarea.appendText("[INFO] Disconnected\n");
  });

  sendButton.onClick.listen((e) {
    if (ws.readyState == WebSocket.OPEN) {
      if (input.value.trim().isNotEmpty) {
        ws.send(input.value.trim());
        textarea.appendText("[SENT] ${input.value.trim()}\n");
        input.value = '';
      }
    } else {
      textarea.appendText("[INFO] WebSocket not open\n");
    }
  });

  closeButton.onClick.listen((e) {
    if (ws.readyState != WebSocket.CLOSED && ws.readyState != WebSocket.CLOSING) {
      ws.close();
    } else {
      textarea.appendText("[INFO] Connection already closed or closing\n");
    }
  });
}
