class Soldier {
  String name;
  double damage;

  Soldier(this.name, this.damage);

  @override
  String toString() {
    return "Name: $name | Damage: $damage";
  }
}

void main() {
  List<int> numbers = [5, 2, 3, 1, 2, 4, 6];
  print("Numbers: $numbers");
  numbers.sort();
  print("Sorted Numbers: $numbers");

  List<Soldier> soldiers = [
    Soldier("Ahmed", 500),
    Soldier("Mohamed", 240),
    Soldier("Khaled", 300),
  ];

  print("Soldiers: $soldiers");

  soldiers.sort((a, b) => a.damage.compareTo(b.damage));

  print("Sorted Soldiers: $soldiers");
}
