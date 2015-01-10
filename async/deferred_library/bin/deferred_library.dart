/*
 * Why use deferred libraries?
 * see http://blog.sethladd.com/2013/04/lazy-load-libraries-in-dart.html
 */

// Here we declare that loading of these two libraries is deferred
import 'foo_italian.dart' deferred as foo_italian;

import 'foo_korean.dart' deferred as foo_korean;

void main() {
  // load the libraries
  foo_italian.loadLibrary().then(onItalianLoaded);
  foo_korean.loadLibrary().then(onKoreanLoaded);
}

void onItalianLoaded(_) {
  foo_italian.speak();
}

void onKoreanLoaded(_) {
  foo_korean.speak();
}
