/*
 * Why use deferred libraries?
 * see http://blog.sethladd.com/2013/04/lazy-load-libraries-in-dart.html
 */

import 'dart:async';

// Here we declare that loading of these two libraries is deferred
@lazyItalian
import 'package:deferred_library_sample/foo_italian.dart'  as foo_italian;

@lazyKorean
import 'package:deferred_library_sample/foo_korean.dart'  as foo_korean;


const lazyItalian = const DeferredLibrary('foo_italian');
const lazyKorean = const DeferredLibrary('foo_korean');

void main() {
  // Libraries are actually loaded
  lazyItalian.load().then(onItalianLoaded);
  lazyKorean.load().then(onKoreanLoaded);
}

void onItalianLoaded(_) {
  foo_italian.speak();
}

void onKoreanLoaded(_) {
  foo_korean.speak();
}
