
main() {
  print(Gelato.values);
  print(Gelato.bacio.index);
  print(Gelato.cioccolato.index);
  print(Gelato.nocciola.index);

  var option = Gelato.cioccolato;

  switch (option) {
    case Gelato.bacio:
      print("Bacio!");
      break;
    case Gelato.cioccolato:
      print("Cioccolato!");
      break;
    case Gelato.nocciola:
      print("Nocciola");
      break;
  }
}

enum Gelato {
  bacio,
  cioccolato,
  nocciola
}