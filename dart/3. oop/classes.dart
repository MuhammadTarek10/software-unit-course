class Car {
  String brand;
  String model;
  double speed;

  Car(this.brand, this.model, this.speed);

  // * add method for printing
  void info() {
    print("[Brand: $brand | Model: $model | Speed: $speed]");
  }

  // * override toString method
  @override
  String toString() {
    return "$brand | Model: $model | Speed: $speed";
  }
}

void main() {
  Car bmw = Car("BMW", "M3", 150);
  Car nissan = Car("Nissan", "140F", 100);
  // print("BMW Car: [${bmw}] || Nissan Car: [${nissan}]"); // ? Before to String?

  bmw.info();
  nissan.info();

  print("---------------");
  // print("BMW Car: [${bmw}] || Nissan Car: [${nissan}]"); // ? After to String
}
