import 'dart:collection';

main() {
  final hashSet = new HashSet<int>(
        equals: (int e1, int e2) => e1.abs() == e2.abs(),
         hashCode: (int e) => e.abs().hashCode);
  
  hashSet.addAll([2, -2, 1, 3, 1]);
  print(hashSet);
  
  
  int reduction = hashSet.reduce((value, element) => value + element);
  print(reduction);
  
  print(hashSet.contains(5));
  
  print(hashSet.contains(3));
  
  print(hashSet.add(3)); //Three is in hashSet so return false.
  print(hashSet);
  
  HashSet hashSet2 = new HashSet.from(hashSet);
  
  print(hashSet.containsAll(hashSet2));
  
  hashSet2.addAll([4,5,6]);
  print(hashSet2);
  
  print(hashSet.containsAll(hashSet2));

  print(hashSet.intersection(hashSet2));
  
  
}
