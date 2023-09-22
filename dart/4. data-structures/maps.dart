void main() {
  Map<int, String> names = {
    1: "Ahmed",
    2: "Khaled",
  };

  print("Names: $names");

  // * Adding to map
  names[3] = "Mohsen";

  print("Names: $names");

  // * Looping in map
  for (MapEntry entry in names.entries) {
    print(entry);
  }
}
