import 'dart:math';

main() {

  // Max of two numbers
  print(max(50, 60));             // 60
  // Max of three numbers
  print(max(max(10, 100), 1000)); // 1000
  // Min of two numbers
  print(min(-50, 50));            // -50
  // Min of three numbers
  print(min(min(1, 8), 5));       // 1

  // Random numbers
  // New random number generator
  Random rnd = new Random();

  // Next random integer between 0 and a given maximum (excluded)
  print(rnd.nextInt(10));

  // Next random double between 0.0 and 1.0 (excluded)
  print(rnd.nextDouble());

  // Next random boolean
  print(rnd.nextBool());


  // Positive square root (returns a double)
  print(sqrt(1764));  // 42.0

  // Rounding numbers (methods from dart:core library)
  // Notice that double numbers are in parentheses to provide better readability
  print((1.34).round());        // 1
  print((1.51).round());        // 2
  print((1.1).floor());         // 1
  print((1.1).floorToDouble()); // 1.0
  print((4.2).ceil());          // 5
  print((4.2).ceilToDouble());  // 5.0


  // Powers
  print(pow(2, 11));      // 2048
  print(pow(1764, 0.5));  // 42.0
  print(pow(0, 0));       // 1
  print(pow(3, -1));      // 0.3333333333333333

  // Trigonometric functions. Arguments are expressed in radians
  print(PI);                  // 3.141592653589793
  print(sin(30 * PI/180));    // 0.49999999999999994
  print(cos(toRadians(30)));  // 0.8660254037844387
  print(tan(toRadians(30)));  // 0.5773502691896257

  // Inverses
  print(toDegrees(asin(1)));      // 90.0
  print(toDegrees(acos(0.866)));  // 30.002910931188026
  print(toDegrees(atan(0.577)));  // 29.984946007397852

  // Natural logarithms and natural exponent (e)
  print(log(10)); // 2.302585092994046
  print(exp(1));  // 2.718281828459045
  print(E);       // 2.7182818[...] `E` is the base of the natural logarithms
  print(pow(E, log(42)).ceilToDouble() == log(exp(42))); // true
}

// Helper functions to convert degrees to radians and viceversa
double toRadians(num theta) => theta * (PI/180);
double toDegrees(num theta) => theta * (180/PI);
