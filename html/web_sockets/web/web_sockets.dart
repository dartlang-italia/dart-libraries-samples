import 'dart:html';

void main() {
  // DOM elements selection
  TextAreaElement textarea = querySelector("#log");
  InputElement input = querySelector("#input");
  ButtonElement sendButton = querySelector("#btn");
  ButtonElement closeButton = querySelector("#close");

  // Creates a new websocket connection
  WebSocket ws = new WebSocket("ws://echo.websocket.org");

  // Registers a callback to the onOpen event
  ws.onOpen.listen((e) {
    textarea.appendText("[INFO] Connected\n");

    // Registers a callback to the onMessage event
    ws.onMessage.listen((MessageEvent e) {
      textarea.appendText("[RECEIVED] ${e.data}\n");
    });
  });

  // Registers a callback to the onClose event
  ws.onClose.listen((e) {
    textarea.appendText("[INFO] Disconnected\n");
  });

  sendButton.onClick.listen((e) {
    // If the readyState is OPEN...
    if (ws.readyState == WebSocket.OPEN) {
      if (input.value.trim().isNotEmpty) {
        // ... sends a message
        ws.send(input.value.trim());
        textarea.appendText("[SENT] ${input.value.trim()}\n");
        input.value = '';
      }
    } else {
      textarea.appendText("[INFO] WebSocket not open\n");
    }
  });

  closeButton.onClick.listen((e) {
    // If connection is not closed or closing...
    if (ws.readyState != WebSocket.CLOSED && ws.readyState != WebSocket.CLOSING) {
      // closes connection
      ws.close();
    } else {
      textarea.appendText("[INFO] Connection already closed or closing\n");
    }
  });
}
