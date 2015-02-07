// Run as:
// dart --enable-async test_async_unittest_sample.dart

import 'package:unittest/unittest.dart';
import 'package:unittest_sample/unittest_sample.dart';

main() {

  var iHazMathSkills = new IHazMathSkills();

  group('IHazMathSkills',(){
    test('add',(){
      iHazMathSkills.add(1,1)
      .then((result){
        expect(2, result);
      });
    });
  });
}
