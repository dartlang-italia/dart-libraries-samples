// TODO: add comments
// Credits: excerpt from "Dart and Web Components" talk by Seth Ladd @ JavaZone 2013

class Hug {
  int strength;
  Hug(this.strength);

  Hug.light() {
    this.strength = 0;
  }

  Hug operator +(Hug other) {
    return new Hug(this.strength + other.strength);
  }

  void patBack({int hands: 1}) {
    // Named or optional params, with default values
  }

  String toString() => "Embraceometer reads $strength";

}

main() {
  Hug a = new Hug(5);
  Hug b = new Hug.light();
  print(a + b); // E,braceometer reads 5
}
