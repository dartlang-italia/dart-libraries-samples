import 'dart:html';
import 'dart:web_sql';

void main() {

  // TODO: moar comments
  SqlDatabase sql;
  String dbName = "myDb";
  String displayName = "My Database";
  int estimatedSize = 4 * 1024 * 1024;
  String version = "1";

  ParagraphElement pMessage = querySelector('#message');
  InputElement inputItem = querySelector('#inputItem');
  ButtonElement btnAddItem = querySelector('#btnAddItem');
  ButtonElement btnClearTable = querySelector('#btnClearDb');
  DivElement divResults = querySelector('#results');

  // Checking for browser support
  if (!SqlDatabase.supported) {
    pMessage.text = "It looks like WebSQL is not supported on this browser :-(";
    btnAddItem.disabled = true;
    inputItem.disabled = true;
  }

  sql = window.openDatabase(dbName, version, displayName, estimatedSize);

  sql.transaction((tx) {
    print("Creating table if not exists");
    tx.executeSql('CREATE TABLE IF NOT EXISTS things (value unique)', []);

    tx.executeSql('SELECT * FROM things', [], (tx, SqlResultSet resultSet) {
      resultSet.rows.forEach((row) {
        appendToResultDiv(divResults, row['value']);
      });
    });

  });

  btnAddItem.onClick.listen((e) {

    String value = inputItem.value.trim();

    if (value.isNotEmpty) {
      sql.transaction((tx) {
        tx.executeSql('INSERT INTO things (value) VALUES (?)', [value],
            (tx, SqlResultSet resultSet) {

          appendToResultDiv(divResults, value);
          inputItem.value = "";

        });
      });
    }
  });

  btnClearTable.onClick.listen((e) {
    sql.transaction((tx) {
      tx.executeSql('DELETE FROM things', []);
      divResults.children.clear();
    });
  });

}

void appendToResultDiv(DivElement divResults, String value) {
  ParagraphElement p = new ParagraphElement();
  p.text = value;
  divResults.append(p);
}

