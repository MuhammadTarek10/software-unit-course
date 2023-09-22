void main() {
  String str = "ahmed9+mohamed4";

  List<String> numbers = [];
  String operator = "";

  for (int i = 0; i < str.length; i++) {
    if (str[i] == "+" ||
        str[i] == "-" ||
        str[i] == "*" ||
        str[i] == "/" ||
        str[i] == "%") {
      operator = str[i];
    }
    if (str[i] == "0" ||
        str[i] == "1" ||
        str[i] == "2" ||
        str[i] == "3" ||
        str[i] == "4" ||
        str[i] == "5" ||
        str[i] == "6" ||
        str[i] == "7" ||
        str[i] == "8" ||
        str[i] == "9") {
      numbers.add(str[i]);
    }
  }

  print(numbers);
  print(operator);

  if (operator == "+") {
    print(add(double.parse(numbers[0].toString()),
        double.parse(numbers[1].toString())));
  } else if (operator == "-") {
    print(subtract(double.parse(numbers[0].toString()),
        double.parse(numbers[1].toString())));
  } else if (operator == "*") {
    print(multiply(double.parse(numbers[0].toString()),
        double.parse(numbers[1].toString())));
  } else if (operator == "/") {
    print(divide(double.parse(numbers[0].toString()),
        double.parse(numbers[1].toString())));
  } else if (operator == "/") {
    print(divide(double.parse(numbers[0].toString()),
        double.parse(numbers[1].toString())));
  } else
    print("Invalid Operator");
}

double add(double num1, double num2) {
  return num1 + num2;
}

double subtract(double num1, double num2) {
  return num1 - num2;
}

double multiply(double num1, double num2) {
  return num1 * num2;
}

double divide(double num1, double num2) {
  return num1 / num2;
}
