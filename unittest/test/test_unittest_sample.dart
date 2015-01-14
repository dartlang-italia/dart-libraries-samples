import 'package:unittest/unittest.dart';
import 'package:unittest_sample/unittest_sample.dart';

main() {

  var iHazMathSkills = new IHazMathSkills();
  num result = iHazMathSkills.addSync(1,1);

  group('IHazMathSkills',(){
    test('add',(){
      expect(2, result);
    });
  });
}
