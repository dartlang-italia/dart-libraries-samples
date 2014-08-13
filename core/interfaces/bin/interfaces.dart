// TODO: comments
// TODO: complete

// Abstract class
abstract class Toy {
  Toy() {
    print("New toy created");
  }
}

// Interface
abstract class RemoteControllable {
  void onArrowUp();
  void onArrowDown();
  void onArrowLeft();
  void onArrowRight();
}


class ToyCar extends Toy {
}

class ToyRCCar extends ToyCar implements RemoteControllable {

  void onArrowUp() {
    /* do something */
  }

  void onArrowDown() {
    /* do something */
  }

  void onArrowLeft() {/* do something else*/}
  void onArrowRight() {/* do something else*/}
}


void main() {
  ToyCar car = new ToyCar();
  ToyRCCar rcCar = new ToyRCCar();

  print(car is RemoteControllable);
  print(rcCar is RemoteControllable);
}
