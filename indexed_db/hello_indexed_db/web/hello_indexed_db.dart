import 'dart:html';
import 'dart:indexed_db';

void main() {
  // FIXME: buggy
  // Database data
  Database db;
  String dbName = 'My IndexedDB';
  String store = 'things';
  int version = 1;

  // DOM Elements
  ParagraphElement pMessage = querySelector('#message');
  InputElement inputKeyItem = querySelector('#inputKeytem');
  InputElement inputValueItem = querySelector('#inputValueItem');
  ButtonElement btnAddItem = querySelector('#btnAddItem');
  ButtonElement btnClearTable = querySelector('#btnClearDb');
  DivElement divResults = querySelector('#results');

  // Checking for browser support
  if (!IdbFactory.supported) {
    pMessage.text = "It looks this browser doesn't support IndexedDB :-(";
    btnAddItem.disabled = true;
    inputValueItem.disabled = true;
  }

  // Opening the database
  window.indexedDB.open(dbName).then((Database _db) {
    if (!_db.objectStoreNames.contains(store)) {
      // Store doesn't exist
      _db.close();

      // Creating object store
      window.indexedDB.open(dbName, version: version + 1, onUpgradeNeeded: (e) {
        Database _db = e.target.result;
        _db.createObjectStore(store);
        db = _db;
        refreshView(divResults, db, store);
      });

    } else {
      db = _db;
      refreshView(divResults, db, store);
    }
  });

  btnAddItem.onClick.listen((_) {
    String key = inputKeyItem.value.trim();
    String value = inputValueItem.value.trim();

    if (db != null && value.isNotEmpty && key.isNotEmpty) {
      // Beginning transaction
      Transaction tx = db.transaction(store, 'readwrite');
      tx.objectStore(store).put(value, key).then((_) {
        inputKeyItem.value = "";
        inputValueItem.value = "";
        print("aggiorno");
        refreshView(divResults, db, store);
      });
    }
  });

}

void refreshView(DivElement divResults, Database db, String store) {

  divResults.children.clear();

  var trans = db.transaction(store, 'readonly');
  var objStore = trans.objectStore(store);


  objStore.openCursor(autoAdvance: true).listen((c) {

    ParagraphElement p = new ParagraphElement();
    p.innerHtml = '<b>${c.key.toString()}:</b> ${c.value.toString()}';
    divResults.append(p);
  });


}
