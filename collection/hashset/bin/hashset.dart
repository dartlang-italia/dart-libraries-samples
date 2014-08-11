import 'dart:collection';

main() {
  final hashSet = new HashSet<int>(
        equals: (int e1, int e2) => e1.abs() == e2.abs(),
         hashCode: (int e) => e.abs().hashCode);
  
  hashSet.addAll([2, -2, 1, 3, 1]);
  print(hashSet);
  
  
  int reduction = hashSet.reduce((value, element) => value + element);
  print(reduction);
}
