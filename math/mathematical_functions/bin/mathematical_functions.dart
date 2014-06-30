// Imports the library
import 'dart:math';

main() {

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

  // Powers
  print(pow(2, 11));      // 2048
  print(pow(1764, 0.5));  // 42.0
  print(pow(0, 0));       // 1
  print(pow(3, -1));      // 0.3333333333333333

  // Trigonometric functions. Arguments are expressed in radians
  print(PI);  // 3.141592653589793
  print(sin(30 * PI/180));  // 0.49999999999999994
  print(sin(toRadians(30)));  // 0.49999999999999994

  // Asserting trigonometric identities
  double fn1 = tan(toRadians(30));
  print(tan(toRadians(29.999999999999994671)));
  print(sin(toRadians(30)) * 1 / cos(toRadians(30)));


}

// Helper function to convert degrees to radians
double toRadians(num theta) => theta * (PI/180);