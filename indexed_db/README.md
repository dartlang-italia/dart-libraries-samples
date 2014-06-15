# dart:indexed_db

API Reference: [dart:indexed_db library](https://api.dartlang.org/apidocs/channels/stable/dartdoc-viewer/dart-dom-indexed_db) 

---

A client-side key-value store with support for indexes.

Many browsers support IndexedDB&mdash;a web standard for
an indexed database.
By storing data on the client in an IndexedDB,
a web app gets some advantages, such as faster performance and persistence.
To find out which browsers support IndexedDB,
refer to [Can I Use?](http://caniuse.com/#feat=indexeddb)

In IndexedDB, each record is identified by a unique index or key,
making data retrieval speedy.
You can store structured data,
such as images, arrays, and maps using IndexedDB.
The standard does not specify size limits for individual data items
or for the database itself, but browsers may impose storage limits.

## Using indexed_db

The classes in this library provide an interface
to the browser's IndexedDB, if it has one.
To use this library in your code:

    import 'dart:indexed_db';

A web app can determine if the browser supports
IndexedDB with [IdbFactory.supported]:

    if (IdbFactory.supported)
      // Use indexeddb.
    else
      // Find an alternative.

Access to the browser's IndexedDB is provided by the app's top-level
[Window] object, which your code can refer to with `window.indexedDB`.
So, for example,
here's how to use window.indexedDB to open a database:

    Future open() {
      return window.indexedDB.open('myIndexedDB',
          version: 1,
          onUpgradeNeeded: _initializeDatabase)
        .then(_loadFromDB);
    }
    void _initializeDatabase(VersionChangeEvent e) {
      ...
    }
    Future _loadFromDB(Database db) {
      ...
    }


All data in an IndexedDB is stored within an [ObjectStore].
To manipulate the database use [Transaction]s.

## Other resources

Other options for client-side data storage include:

[Window.localStorage]&mdash;a
basic mechanism that stores data as a [Map],
and where both the keys and the values are strings.

[dart:web_sql]&mdash;a database that can be queried with SQL.

For a tutorial about using the indexed_db library with Dart,
check out
[Use IndexedDB](http://www.dartlang.org/docs/tutorials/indexeddb/).

[IndexedDB reference](http://docs.webplatform.org/wiki/apis/indexeddb)
provides wiki-style docs about indexedDB
