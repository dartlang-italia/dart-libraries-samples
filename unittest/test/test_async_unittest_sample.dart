// Run as:
// dart --enable-async test_async_unittest_sample.dart

import 'package:unittest/unittest.dart';
import 'package:unittest_sample/unittest_sample.dart';

main() async {

  var iHazMathSkills = new IHazMathSkills();
  var result = await iHazMathSkills.add(1,1);

  group('IHazMathSkills',(){
    test('add',(){
      expect(2, result);
    });
  });
}
