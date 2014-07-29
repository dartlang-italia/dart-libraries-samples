import 'dart:html';

void main() {
  TextAreaElement textarea = querySelector('#viewData');
  ButtonElement btnLoadData = querySelector('#loadData');

  btnLoadData.onClick.listen((e) {

    HttpRequest.getString("data.txt").then((String data) {
      textarea.value = data;
    });

  });

}

