library unittest_sample;
import 'dart:async';


class IHazMathSkills {
  num addSync(num a, num b) {
    return a + b;
  }

  Future<num> add(num a, num b) {
    return new Future.value(a + b);
  }
}